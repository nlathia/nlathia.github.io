---
layout: post
title: "Building an analytics feature store"
description: .
categories: [monzo, tech-lead, machine-learning]
---

The corner of the internet that I read is awash with posts about [feature stores](https://blog.feast.dev/post/what-is-a-feature-store): systems that aim to enable the (re-)use of machine learning features across different models and use cases. In part, this is because there are now a lot of companies, ranging from [tecton](https://www.tecton.ai/blog/what-is-a-feature-store/) to [streamsql](https://streamsql.io/) (and more!) who are building feature store technologies and platforms-- this idea is slowly becoming an established part of the machine learning _systems_ ecosystem.

A few months ago, we built a feature store at Monzo; in light of that, I thought I'd share some of the thinking that motivated us to build one and how we went about it. Specifically, the feature store that we built does not solve for all of the different use cases that you may hear about in a pitch for a feature store--we narrowed its functionality down to what we needed it to do and avoided reinventing what other systems already did.

Before we dive in: the high-level background that you need to know is that we run our analytics stack [on Google Cloud](https://cloud.google.com/customers/monzo), where we use BigQuery and orchestrate hundreds of SQL queries with Airflow, while our production infrastructure runs [in AWS](https://aws.amazon.com/solutions/case-studies/monzo/), where we have [thousands of micro services](https://qconlondon.com/london2020/presentation/modern-banking-1500-microservices) and use Cassandra. The biggest use case we were solving for was reducing the need to _re-implement_ features across both stacks when it was safe to use values we compute in our analytics.

## Isn't a feature store just a database?

When I first pitched the idea of a feature store internally, the feedback that I received was something like "we already do this-- we just haven't been calling them feature stores." Indeed, you can't really look at any corner of our production infrastructure without running into our key-value store!

We did already have two patterns across several systems:

1. Services that would receive a request, fan out a bunch of RPCs, and then cache the resulting "features" into Cassandra. For example, we have a system that filters help content using cached features about users.
2. Services that consume events from NSQ or Kafka to construct "features" about different entities. For example, we have a system that consumes events related to chat messages being sent, and can then serve requests for conversation features, such as all of the messages that one party has sent in a given turn.

The broader pattern that we have is that if a service _needs_ some data (for example, a customer's balance), then it's very easy to make an RPC to another service that will return it. We had no desire to migrate any of our existing features to sit behind any kind of centralised "feature store API;" centralising everything feels a bit counterintuitive to our entire system's design. 

To that end, all of this talk about "feature stores" starts feeling a bit weird: why would we need to have a one, if all of these features are so readily available? 

## Breaking up real-time data from analytics features

As we started shipping machine learning models that use tabular data, we kept finding that many of the features we would input into a model while designing it were _not_ readily available in our production infrastructure.

To take a simple toy example: a customer's balance (accurate to this specific moment) was already available in production, but a customer's 7-day average balance was not, even though this number was available in our _analytics_. We found that we already had an abundance of features in our analytics tables that, if used in production, would specifically be characterised by:

1. Having values that change "slowly" -- these are numbers (generally, different types of aggregations, like averages) that we needed to use but did not specifically need them to be accurate up to the latest microsecond.
2. Being easy to implement in BigQuery SQL, on our historical data, but would be harder (or, more simply, a lot of work) to rebuild and backfill in our production environment.

This narrowed down the purpose and value-add for a prospective feature store in our system: _enabling_ the re-use of slow-changing features from our analytics, in production.

## Pause: should we _never_ reimplement a feature?

Before I carry on describing a system that reduced our need to re-implement features across our analytics and production stacks, I'll pause with a word of warning--which also came up in discussions with others.

Building something _twice_ may, at first glance, sound like a waste of time. However, in some of Monzo's more critical use cases, we need to be able to provide very strong guarantees about our system's correctness.

And, as [one of our Staff Engineers](https://twitter.com/danielchatfield) told me, "the types of mistakes that you can make when writing SQL _are very different_ from the types of mistakes you can make when writing Go." Reimplementing a feature from SQL to Go provides us with two outputs which we can use for reconciliation: if both spit back the same number, we can be more confident that each of the individual implementations is correct.

## System

The first couple of times that we ran into the problem of needing features that existed in our analytics, we built micro services that would query BigQuery.

## What about training data?












