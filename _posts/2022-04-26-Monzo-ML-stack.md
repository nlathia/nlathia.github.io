---
layout: post
title: "Monzo's machine learning stack"
description: Originally published on monzo.com/blog
categories: [machine-learning]
---

_Note_: this post was originally published [here on Monzo's blog](https://monzo.com/blog/2022/04/26/monzos-machine-learning-stack).

Machine learning, popularly referred to as Artificial Intelligence, is a method of using data to teach computers how to do things. Inside of a bank there are lots of areas that benefit from machine learning, ranging from preventing financial crime, building a more efficient and delightful customer service and much, much more.

In previous posts, I’ve given an overview of the machine learning team (in [2020](https://medium.com/data-monzo/machine-learning-at-monzo-d83a7d1a71e1) and [2021](https://medium.com/data-monzo/machine-learning-at-monzo-in-2021-6b3a825db233)) and explained some of the areas we were focusing on. This post is about our platform and tools. Behind the scenes, we’ve spent several years refining our approach to building impactful machine learning systems, and a core part of that is having the right tools in place to make our development experience fast and safe.

## Our early principles

There are lots of different ways that companies build up their machine learning systems. Some companies like [Netflix](https://netflixtechblog.com/system-architectures-for-personalization-and-recommendation-e081aa94b5d8) and [Uber](https://eng.uber.com/michelangelo-machine-learning-platform/) have also blogged about their approaches. Several years ago, a small group of us had a discussion about what core principles we were going to use as we started to think about our approach to model deployment. 

1. **Autonomy**. We decided early on that we want to empower Machine Learning people to work end-to-end. That included deploying their own models into production, rather than requiring a handover to a backend engineer to complete that final step. Our view was that this would speed us up and lead people to think about the end-use of a model while it was being designed.
2. **Flexibility**. We decided that we didn’t want to constrain our capabilities to specific frameworks or types of machine learning, so that people could pick the right tool for the job. We imagined a future where we would be working on a variety of problems with different types of data and we wanted our early efforts to keep as many doors open as possible.
3. **Reuse over rebuild**. Years ago, Monzo already had a strong foundation for a [microservice-based production stack](https://monzo.com/blog/2016/09/19/building-a-modern-bank-backend), and a budding data stack [which has evolved considerably since then](https://monzo.com/blog/2021/10/14/an-introduction-to-monzos-data-stack). We decided we did not want to build an isolated and independent stack for machine learning; instead, we opted to reuse the existing infrastructure and tooling where possible, and focus our efforts on the delta between what existed and what we wanted to achieve.

Over the intervening years, a lot of these early decisions have held and we have benefitted from new features in our production and data stacks. Today, everyone who works in machine learning is embedded into five squads working across four different areas of the company, but we’re all using the same platform and tooling to work on a wide variety of different problems.

## Monzo’s machine learning stack

Here is what our entire machine learning stack looks like today:

![](https://nlathia.github.io/assets/posts/2022-04-26-Monzo-ML-stack/monzo-architecture.png "Monzo's ML stack")

The following sections give a brief overview of each part of this image.

**We use Notebooks for prototyping**

Notebooks are web-based, interactive compute tools. At Monzo, we encourage people to use [Google Colab notebooks](https://colab.research.google.com/) in a similar way that engineers use white boarding tools. They help us do rapid exploration and prototyping, and to get a sense of what could work. The main difference with machine learning is that we need some data to be able to do that.

We've used notebooks to explore the viability of several ideas and to quickly gauge whether it’s worth investing more time into them. We explicitly don’t take notebooks any further than this; when ideas mature, we move them out of notebooks into our codebase.

**We have a monorepo of Python jobs, libraries and command line tools**

Training a machine learning model entails two big steps: preparing a dataset, and then using that data to train a model.

We split these out into two separate jobs, so that we decouple how a dataset is created from how the model is trained. This enables us to experiment with how models are trained without changing how the datasets are created.

All our jobs are committed and peer reviewed before being merged into our shared monorepo on GitHub. We write them in Python, and create them using a base [cookiecutter](https://cookiecutter.readthedocs.io/en/1.7.2/) template.

* Dataset creation jobs orchestrate several BigQuery SQL queries to create the data we need to train a model, and export a versioned snapshot of that data to Google Cloud Storage. The majority of our feature engineering is implemented in SQL: this has allowed us to more easily re-use data that already exists in our data warehouse.
* Model training jobs are run as custom containers on [Google’s AI Platform](https://cloud.google.com/ai-platform/docs/technical-overview) and will often begin by downloading a snapshot of data and end by uploading a trained model. This gives us the flexibility to pick what type of instance we want to run training jobs on (for example, using GPUs for deep learning) and to add parameters to each job. We use Makefile commands to create and submit jobs to the AI platform.

Our monorepo also has a few extra things such as libraries with shared functionality (for example, to save models into our registry), and shared scripts to build and push containers to the [Google Container Registry](https://cloud.google.com/container-registry) and then submit jobs to the AI platform.

**Our model registry is the home of all our trained models**

The final steps of a model training job is to save the trained model by uploading it to our model registry. This is a single place where all machine learning models at Monzo are uploaded and enables us to:
* retrieve the models for inference across both our data stack in Google Cloud and production stack in AWS
* control the state of models as we validate them (we use [shadow mode deployments](https://nlathia.github.io/2020/07/Shadow-mode-deployments.html) extensively)
* capture data about what models are being trained

We have iterated a lot on this system over the last few years and are currently completing a small migration. We’ll write a separate blog post about that journey!

**Batch prediction jobs are orchestrated in our data stack**

We have some models that we want to run on a schedule, for example every day or every week. To enable this, we lean on our reuse over rebuild principle, and run these jobs in our existing data stack.

In practice, we write [dbt models](https://www.getdbt.com/) to transform any data and prepare the input for the batch prediction job, and then we write a Python job that pulls in the data, loads the model, and spits out the predictions. The dbt models and the batch job are orchestrated together using Airflow, which is run by our Data Platform Engineering team. Once the required dbt models have finished running, the job is submitted to the AI Platform.

When the predictions are generated, it’s likely we’ll want to do something with them! This could range from inserting them back into BigQuery for analysis all the way through to triggering a specific action on a customer’s account. Our batch inference jobs publish predictions as events onto [Google Pub Sub](https://cloud.google.com/pubsub/docs/overview) so that they can be picked up by consumers who trigger actions. One of those consumers lives in our production stack, and republishes events onto [NSQ](https://nsq.io/) so that they can be picked up by any backend service and also be injected back into our data warehouse. 

**Real time inference is deployed alongside the rest of the bank**

While there are some models that we want to run on a schedule, there are many others that we want to run in real-time. For example, all of our fraud classifiers need to run every time a transaction is initiated.

Monzo’s production stack is largely written in Go, using Cassandra as the main database ([this QCon talk](https://qconlondon.com/london2020/presentation/modern-banking-1500-microservices) by Suhail Patel and Matt Heath gives a great overview). To serve predictions from machine learning models, we needed to think about three things:

* managing deployments
* managing models
* managing features/inputs to models 

**Deployments**: We introduced Python micro services into Monzo’s production stack, and explicitly decided to keep them as lightweight as possible. In many cases, they are not doing much more than loading a model into memory and serving predictions from one or more handlers; any ‘heavy lifting’ that needs to be done is delegated to Go services. All of these microservices are generated from a template, and have been integrated with our deployment tooling. Our aim was for a Python microservice deployment to be as similar as possible to Go service deployment.

**Models**: We built a model registry in production. It has an API that allows any Python service to ask it for particular models and, if needed, enable Python services to automatically reload new models as they are turned on in production. Based on our flexibility principle, we've shipped scikit-learn, XGBoost, LightGBM, PyTorch, transformers, skorch, and Gensim models and experimented with many more.

**Features** are the input that is required for a machine learning model to make its prediction. We reason about them by calling them either:

* _Operational features_, which are computed in real-time, either by consuming from NSQ event streams or by making RPC requests to other services on demand. For example, we compute text embeddings in real-time, as well as many fraud-related features.
* [_Analytics features_](https://nlathia.github.io/2020/12/Building-a-feature-store.html), which are computed on a schedule in our data warehouse and then transferred from BigQuery into Cassandra for on-demand retrieval. These features do not need to be accurate up to the latest millisecond, but still provide enormous value to our models (for example, aggregations across several months of data).

**Machine learning systems are monitored with the same tools we use to analyse our systems and products**

Understanding the live performance of a model is a critical part of the model development process. For this stage, we lean on our reuse over rebuild principle and have adopted tools that are used across the company. We wanted our monitoring tools to be available to everyone, including people outside of machine learning.

To achieve that, we split model monitoring into three types:

* **System monitoring** covers things related to how healthy the system is: inbound requests, timing, memory and CPU usage, and so on. For this, we use Grafana, just like every backend engineer at Monzo uses for their own services. 
* **Feature monitoring** is about keeping track of the health of the data we ingest into our feature store from our data warehouse. For this, we use the dbt-slack alert integration our Data Platform team built alongside other data validation queries implemented as ingestion preconditions in our feature store. 
* **Model performance monitoring** covers all things related to how impactful the model is: from precision & recall through to impact on specific company metrics (like fraud rates). For this, we use Looker, just like every data scientist at Monzo uses to build product performance dashboards.

Adopting tools that are widely used inside of Monzo for the machine learning cases means that it's easy to make everything accessible to others. For example, product managers will often review Looker dashboards that have machine learning metrics alongside product metrics. This helps to bring our two worlds closer to one another.

## Reflections and future plans

The platform described above has many different parts and each time we work on a machine learning problem, we’ll use the subset of these components that is most relevant to the problem at hand. The range of complexity varies from batch jobs that read from the data warehouse, make predictions, and publish them as event streams through to real-time predictions that use a combination of analytic and operational features.

The main benefit of our current approach is that we spend little to no time managing infrastructure. For example, by implementing feature engineering in SQL (instead of, for example, [Spark](https://spark.apache.org/)) we can take advantage of [BigQuery’s distributed architecture](https://cloud.google.com/blog/products/data-analytics/new-blog-series-bigquery-explained-overview) and we do not need to run or manage clusters to run our jobs. We rarely spin up virtual machines manually. We also have a uniform approach, which means that it is easier to jump from one machine learning system into another, because they all functionally look the same and they all use the same tools. So, upgrades usually are done once and benefit everyone.

There are some notable pieces that are missing from the image above, like offline experiment tracking and automated builds. This does not mean we haven’t thought about these steps! It just means we haven’t yet settled on our preferred way of doing this, and we expect to build this (and more) capability into our systems in the near future.

Right now, our machine learning platform is being adopted by other data teams as well. The Decision Science team has recently started to use this infrastructure to train statistical models for our borrowing products. As part of this, we're also revisiting which pieces of our platform should sit, more broadly, within our Data Platform and we are thinking through which parts of our existing platform we can make safer and easier to use.