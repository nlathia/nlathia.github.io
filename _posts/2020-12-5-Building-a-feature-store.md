---
layout: post
title: "Building a feature store"
description: What is a feature store; why & how did we build one?
categories: [monzo, tech-lead, machine-learning]
---

The corner of the internet that I read is awash with posts about feature stores: systems that aim to be ["the interface between models and data."](https://blog.feast.dev/post/what-is-a-feature-store)

This idea has been around for quite a while, but there are now an increasing number of companies that are building feature store platforms or products--the concept is becoming established in the machine learning system _operations_ arena.

A few months ago, I built a feature store at [Monzo](https://monzo.com/); in light of that, I thought I'd share some of the thinking that motivated my team to need to build one and how I designed it.

As a broad summary: the feature store that I built does not solve for the many different use cases that you may hear about feature store products--our feature store focuses on regularly and safely transferring data between our analytics and production stacks.

Let's begin!

## 🤔 Isn't a feature store just a database?

Well, yes. But also no.

When I first started talking about the idea of a feature store internally, some feedback that I received was 'we already do this–we just haven’t been calling them feature stores.' Indeed, the emphasis of the name "feature store" has often been on the "**store**" aspect, which does make the whole thing sound like it is just a database. The word "**feature**" is often used to mean "some type of data" (e.g., a column in a table).

At Monzo, you can’t look at any corner of our [production infrastructure](https://qconlondon.com/london2020/presentation/modern-banking-1500-microservices) without running into the key-value store we use, Cassandra. In our systems, it’s common for each microservice to have its own keyspace, and for individual services to collect, aggregate, and store the different types of data that they need.

We already had two patterns across several systems which looked like "feature stores:"

1. Services that receive a request, fan out a bunch of calls to other services, and then munge and store the resulting features. For example, we have a system that filters help articles, and caches features about users, who will be actively navigating the content.
2. Services that consume events from streams to construct features about different entities. For example, we have a system that consumes events that occur when chat messages are sent and received, and can then serve requests for features about conversations (e.g., the number of turns).

What this means is that data across our keyspaces is typically organised around the systems that they serve: we design a system first (e.g., a system for user accounts), and the features it holds follows from that design (data about user accounts).

## 🧐 What's different about "feature stores?"

The idea of a feature store is different because it is a system that is meant to prospectively hold a _wide diversity_ of data--nearly anything that could be valuable input to machine learning models. The "features" could even be the output of _other_ machine learning models (predictions or embeddings).

I think this is an important point because this inverts how data is organised in a production system. With a feature store, you can build a separation of concerns between the systems that generate data and the aggregations of that data that are input into ML models. If you want stats about user accounts, you no longer need to know about user account system-- you _just_ query the feature store. 

The main reason that is often stated for having a centralised place for features is that they are _meant to be reused_ to solve different problems. For example, let's say that I'm building a feature, like "average number of transactions in the last 7 days." This feature could potentially be very useful to a whole host of _different_ machine learning models. If we were going to store this data inside of the system that uses it, we may end up:
1. Having to rebuild the same feature in more than one place, and
2. Making it very difficult to discover what features are available for reuse across problems. 

### ⏸ Pause: do these two problems actually matter?

Before I carry on to describe our feature store, I'll pause to reiterate a word of warning that I mentioned in [my last blog post](http://nlathia.github.io/2020/11/Why-ML-code.html). Building something _twice_ may, at first glance, sound like a waste of time. Folks pitching feature stores often tend to drive home that point. However, in some critical use cases, building something twice can help to validate the system's correctness.

As [one of our Staff Engineers](https://twitter.com/danielchatfield) told me, "the types of mistakes that you can make when writing SQL _are very different_ from the types of mistakes you can make when writing Go." Reimplementing a feature from SQL to Go provides us with two outputs which we can use for reconciliation: if both spit back the same number, we can be more confident the implementations are correct.

In short: the "only code things once" pitch doesn't actually work for all use cases.

The second point, regarding discovering features for reuse across problems, is also contentious. You could imagine putting all of your features into a set of wide relational tables. At some point, centralising all of the data would come hand-in-hand with a loss of context about what that data means, and how it should be used. Once you have 1000s of features, a central list of them becomes difficult to navigate.

For example, if you had a feature that describes a user as `is_inactive`, what does that _actually_ mean, and does that definition fit with the new use case?  How do you ensure that the feature store's documentation for this remain lined up with the upstream system that is generating the raw data? How do you avoid ending up with multiple implementations of the same _concept_, expressed as variants of the same code, ad nauseam?

So the "discover all your features" is also a slightly trickier problem that "just put them all in one place."

## 🔍 Narrowing down the problem space

If you open up the website of your favourite company that is offering a feature store, it's more than likely that they'll have a list of five to ten (sometimes more!) problems that their feature store solves: integrations, data sources, consistency, monitoring, versioning, meta-data and documentation, training dataset creation, production serving, and so on.

_It's mind boggling._

Up front, I decided that I had no desire to migrate any of our existing systems to sit behind any kind of centralised "feature store" API. I didn't want the feature store to become a replacement for things that already existed, or a behemoth that is owned by my (small) team. Instead, I learned about what we needed by looking for patterns in the machine learning models that we were shipping. 

Specifically, we didn't need a feature store until this year, when we ramped up how often we were designing and shipping machine learning models that were trained on tabular data (systems we built prior were very NLP-heavy).

When shipping tabular-based models, we kept finding that many of the features we would input into a model while training it were _not_ readily available in our production infrastructure. A large part of this is because our [analytics stack](https://cloud.google.com/customers/monzo), where all of our Data Scientists and Analysts contribute, sits separately from our [production stack](https://aws.amazon.com/solutions/case-studies/monzo/).

Here's a toy example: a customer's account balance, accurate to this specific moment, is already available in production--so doesn't need to be in a feature store. _But_ aggregations on a customer's balance (e.g., a customer's 7-day average balance) were not, even though these numbers were already available in our _analytics_, based on SQL queries that Data Scientists had previously written.

We found that we already had an abundance of features in our analytics tables that, if used in production, would specifically be characterised by:

1. Having values that change "slowly." These are different types of aggregations, like averages and counts, that we wanted to use, but specifically did not need them to be accurate up to the latest microsecond.
2. Being easy to implement in BigQuery SQL, on our historical data, but would be harder (or, more simply, a lot of work) to rebuild and backfill in our production environment.

> Our problem, therefore, narrowed down to "we need a subset of the numbers, that only exist in our analytics, in production."

The first couple of times that anyone in my team ran into this, we queried BigQuery directly from our services, and cached the results. Job done. Over time, the pattern started becoming clearer: we were bound to regularly need this _bridge_ between BigQuery and Cassandra, and didn't want to rebuild it every single time.

> This narrowed down the purpose and value-add for a building a feature store in our system: _enabling_ the safe reuse of slow-changing features from our analytics, in production.

## 🏪 Our analytics feature store

What we have today is a system that automates the journey of shipping features between our analytics (BigQuery) and production (Cassandra) databases.

The process starts with a Data Scientist writing some SQL, as they usually do. They tag it as a query that builds a feature table. These tables are automaticaly scheduled and generated alongside all of our other analytics tables, at varying frequencies (daily, hourly, etc.), using Airflow. We use [dbt](https://www.getdbt.com/), and so each query will be written with [tests](https://docs.getdbt.com/docs/building-a-dbt-project/tests/).

By design, feature tables must specificy a `subject_type` column. This defines the entity that the feature described, such as a "user" feature or a "sort code" feature. The table must also have a corresponding `subject_id`, which is the actual ID of the user for that row. The schema of this table is replicated in the feature store Go service, because we do not want it to "blindly" ingest data.

The creation of feature tables is monitored: a cron jobs regularly checks whether those tables should be sync'ed into Cassandra. A table should be sync'ed if:
* It has been recreated (compared to the last time it was sync'ed), and;
* It passes data validation tests (i.e., it doesn't accidentally have garbage in it);

When a table needs to be sync'ed, it gets partitioned into batches and then exported as line-delimited JSON into Google Cloud Storage.

From there, these batches are read and written into Cassandra--effectively changing a "wide" BigQuery table (e.g. having 10s of features per user) into a very "tall" Cassandra table (one row per user per feature), which enables querying directly for the value of a specific feature.

Finally, the feature store service has endpoints so that other services can query for different types of features; e.g., requesting all the features we have for a given user. These endpoints return the feature values and one field of meta-data: when that feature was last set in the store.

### 😈  The devil is in the detail (what we valued, what we left out)

This high-level view of the system masks a lot of smaller decisions that we made along the way. I will highlight a few:

* _Partial updates_. Our sync jobs write into one table. That means that if you start querying the feature store for the latest features for a set of users _while it is writing in a new batch_, you may get a mixture of older and newer values.
* _Testing_. You may have spotted that we test the data twice: dbt tests for SQL queries, and validation tests that must pass before a table can be exported. We validate the data on both sides of the system. This gives us more flexibility and helps us raise alerts when things fail.
* _Staging environments_. The idea of a [staging environment](https://en.wikipedia.org/wiki/Deployment_environment#Staging) is common in Engineering, but less common in Analytics. We create fake data in our staging environment, to enable testing functional changes to the feature store before shipping it.
* _Point in time estimates_. I originally excluded any functionality related to creating _training_ datasets from our feature store; it's common to hear that these systems include an ability to do point-in-time feature extraction (e.g., what was the value for feature X about user Y on date Z?). However, we ended up getting this "for free:" every time I set new data into the feature store, I added some logging about what those feature values were. This means that we can reconstruct the values stored in the system at any point in time. 

## ✅ That's it!

This system is now live and we are using it to continue shipping a variety of tabular machine learning models. I'm keeping a close eye on how we use it, and will continue adding new functionality to it, as we need it.

There is a ton of content online about how other companies have built features stores; [featurestore.org](https://www.featurestore.org/) is a good place to start.
