---
layout: post
title: "Building a feature store"
description: What is a feature store; why & how did we build one?
categories: [monzo, tech-lead, machine-learning]
---

The corner of the internet that I read is awash with posts about feature stores: systems that aim to be ["the interface between models and data."](https://blog.feast.dev/post/what-is-a-feature-store) This idea has been around for quite a while, but there are now an increasing number of companies that are building feature store platforms or products--the concept is becoming established in the machine learning system _operations_ arena.

A few months ago, we built a feature store at Monzo; in light of that, I thought I'd share some of the thinking that motivated us to build one and how we designed it.

As a broad summary: the feature store that we built does not solve for the many different use cases that you may hear about in a pitch for a feature store product--we narrowed its functionality down to what _we needed_ it to do and avoided reinventing what other systems of ours already did.

## Isn't a feature store just a database?

Well, yes. But also no.

When I first started talking about the idea of a feature store internally, some of the earliest feedback that I received was “we already do this–we just haven’t been calling them feature stores.” Indeed, the emphasis of the name feature store has often been on the “store” aspect, which does make the whole thing sound like it is just a database. The word “feature” is often diminished, to broadly mean “some type of data” (e.g., a column in a table).

At Monzo, you can’t look at any corner of our production infrastructure without running into our key-value store. In our systems, it’s common for each microservice to have its own keyspace, and for some services to collect, aggregate, and store the different types of data that they need. We already had two patterns across several systems which looked like feature stores:

1. Services that receive a request, fan out a bunch of RPCs to other services, and then cache the resulting “features” into Cassandra. For example, we have a system that filters help articles, and caches features about users (who will be actively navigating the content) to make things more efficient.
2. Services that consume events from streams to construct “features” about different entities. For example, we have a system that consumes events that occur when chat messages are sent and received, and can then serve requests for features about conversations (e.g., the number of turns).

What this means is that data across our keyspaces is typically organised around the systems that they serve. We design a system first, and the data it holds follows from that design.

## What's different about "features?"

A feature store is different because it is a system that is meant to prospectively hold a _wide diversity_ of data--nearly anything that could be valuable input to a machine learning model or rule engine. I think this is an important point because, in doing so, it inverts how data is typically organised in a production system.

The main motivation for having a centralised place for features is that they  are _meant to be reused_ to solve different problems.

For example, let's say that I'm building some features for my ML model. It could be something simple, like "average number of transactions in the last 7 days." This feature could potentially be very useful to a whole host of _different_ machine learning models--but if we built all of our systems in the "traditional" way, we may end up
1. Having to rebuild the same feature in more than one place, and
2. Making it very difficult to discover what features are available for (re-)use across problems. 

### Pause: should we _never_ reimplement a feature?

Before I carry on to describe a system that reduced our need to reimplement features across our analytics and production stacks, I'll pause to reiterate a word of warning that I mentioned in [my last blog post](http://nlathia.github.io/2020/11/Why-ML-code.html).

Building something _twice_ may, at first glance, sound like a waste of time. Folks pitching feature stores often tend to drive home that point. However, in some of Monzo's more critical use cases, we need to be able to provide very strong guarantees about our system's correctness.

And, as [one of our Staff Engineers](https://twitter.com/danielchatfield) told me, "the types of mistakes that you can make when writing SQL _are very different_ from the types of mistakes you can make when writing Go." Reimplementing a feature from SQL to Go provides us with two outputs which we can use for reconciliation: if both spit back the same number, we can be more confident the implementations are correct.

In short: the "only code things once" pitch doesn't work for all use cases.

## Figuring out what we needed

If you open up the website of your favourite company that is offering a feature store, it's more than likely that they'll have a list of five to ten (sometimes more!) problems that their feature store solves: integrations, data sources, consistency, monitoring, versioning, meta-data, training dataset creation, production serving, and so on.

_It's mind boggling._ Where do you even begin?

Up front, we decided that we had no desire to migrate any of our existing keyspaces to sit behind any kind of centralised "feature store API." If we could already get some numbers from an existing system, we should just do that.

We learned about what we needed by looking for patterns in the machine learning models that we were shipping. 

Specifically, we didn't have a need for a feature store until this year, when we started designing and shipping machine learning models that were trained on tabular data. When doing so, we kept finding that many of the features we would input into a model while training it were _not_ readily available in our production infrastructure.

Here's a toy example: a customer's balance (accurate to this specific moment) was already available in production, but a customer's 7-day average balance was not, even though this number was available in our _analytics_, based on a SQL query that a Data Scientist had previously written. We found that we already had an abundance of features in our analytics tables that, if used in production, would specifically be characterised by:

1. Having values that change "slowly" -- these are numbers (generally, different types of aggregations, like averages and counts) that we needed to use but did not specifically need them to be accurate up to the latest microsecond.
2. Being easy to implement in BigQuery SQL, on our historical data, but would be harder (or, more simply, a lot of work) to rebuild and backfill in our production environment.

## What we built

The high-level background about Monzo's infrastructure that you need to know is that
1. We run our analytics stack [on Google Cloud](https://cloud.google.com/customers/monzo), where we use dbt to write BigQuery SQL, and orchestrate thousands of queries with Airflow, to generate various tables representing users, transactions (etc.)--mostly for analytics and reporting.
2. Our production infrastructure runs [in AWS](https://aws.amazon.com/solutions/case-studies/monzo/), where we have [thousands of micro services](https://qconlondon.com/london2020/presentation/modern-banking-1500-microservices) and use Cassandra. 

The few folks [doing machine learning](http://nlathia.github.io/2020/10/Monzo-ML.html) sit at the intersection of these two stacks: we train models in Google Cloud, and ship them in AWS.

The first couple of times that we ran into the problem of needing features that only existed in our analytics, we would query BigQuery directly from our services (and cache the results). Over time, the pattern started becoming clear: we were bound to regularly need this _bridge_ between BigQuery and Cassandra, and didn't want to rebuild it every single time.

This narrowed down the purpose and value-add for a building a feature store in our system: _enabling_ the reuse of slow-changing features from our analytics, in production.


### What we left out

Our feature store enables a Data Scientist to write SQL (using dbt) that generates BigQuery tables, which will then be sync'ed into Cassandra so that a Backend Engineer can build systems that query for that data in production.





https://www.featurestore.org/




