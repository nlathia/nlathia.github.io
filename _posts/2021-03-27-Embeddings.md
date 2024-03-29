---
layout: post
title: "Embedding stores"
description: Protecting customer data while training neural networks
categories: [machine-learning]
---

If you look online at any tutorial for training models with unstructured data (primarily: text or images) they usually start by describing data loaders that can read the raw data itself. For example, a Keras image classifier [example](https://blog.keras.io/building-powerful-image-classification-models-using-very-little-data.html) starts by suggesting that the pictures of cats and dogs be stored in different folders on your machine.

When training these kinds of models in a company setting, there are two big challenges that arise which make this approach infeasible:
1. *Protecting customer data* -- any kind of unstructured data needs to be stored securely and protected; that includes ensuring that the data cannot be accessed by all company employees. 
2. *Data wrangling* -- when unstructured datasets are sufficiently large, it becomes hard to manage the process of creating datasets from them, and -- specifically -- joining them with labels which are contained in other data sources.

Last year, this problem came to the front when my team was building a new classifier system. The context fit both of these problems above: we wanted to train models on one type of unstructured data, without giving individuals access to raw data (protecting our customer's privacy is our first priority!), and we needed to find a way to easily wrangle that data.

How we tackled this has come up several times in different conversations; this blog post describes the approach that we took. 

## 🔢 Logging events with embeddings from pretrained models

At the beginning of the project, we knew we were dealing with a type of unstructured data that is stored securely--it is beyond the reach of majority of employees. We thefore opted to build a system that would automatically generate embeddings of the data in our production stack, where that data was generated.

An _embedding_ is a numerical representation of data that is obtained by passing it through an _encoder_ (i.e., a neural network). Those numbers are meaningful, in that it is still possible to train models with them, but they would just look like fairly random numbers to you and I.

Typically, Data Scientists may start training a model by embedding the data. By building this system which does that for them, the process of generating embeddings could happen automatically, without any human needing direct access to any raw data.

Pre-trained models for text and images now come out of the box (e.g., have a look at [torchvision.models](https://pytorch.org/vision/stable/models.html), or [huggingface](https://huggingface.co/models)), and so we built a way for our system to generate and log embeddings of this data at its source from one of these public pre-trained encoders. 

The main (early) decision we needed to make was _which_ encoder we wanted to put into production--we decided this based on how those encoders tend to perform on public/research datasets. By only shipping one encoder into production, we were stuck with it for the time being: in practice, this means that we could not experiment with other encoder architectures for now.

All of our event logs find their way to BigQuery.

## 🏷 Data wrangling could now happen in SQL

The result of the previous step was that BigQuery now contained embeddings for our unstructured data. As a Data Scientist, you can now start working with those numbers but can't see the original data that created them.

BigQuery is also the same place where we have _all of our other event logs_, and so the process of creating and updating training/validation/test datasets was distilled into writing different types of SQL queries.

The benefit of bringing this process into BigQuery was along two dimensions:
1. Generating the "labels" we wanted to apply to each example required some data wrangling. In the online tutorials, things are super clean -- e.g., "cat" or "dog." In our case, the labels themselves needed to be derived from one or more raw events; a process that was already happening in our BigQuery analytics.
2. The training snapshots we created were also subject to different types of rules and business logic. An example that could bring this to life is: imagine wanting to exclude the images in your dataset that come from customers who have closed their account, or only train using images that were uploaded in the last three months. If you needed to do this type of wrangling with actual files (or file ids), things might get a bit messy or be a bit more error prone -- particularly if you're at the early stages of a project and would like to iterate often.

## 🤖 We trained shallow models on the embeddings

The previous two steps gave us a fast and safe way to create (and re-create or modify) training datasets -- so we could start training models. All of those models were shallow neural networks that were fed the embeddings and labels while being trained.

The biggest trade-off of this approach was that any model we trained could backpropagate its errors _only_ as far back as where we were starting off from: the pre-trained model's embeddings.

When you look at examples online where image and text classifiers are fine-tuned, starting from a pre-trained model, it's very common to see training begin this way: the pre-trained model's layers are frozen (to prevent them from being modified) and the only training happens in the new layer(s) that have been added on top. Online tutorials typically go on to unfreeze layers, sometimes incrementally. We could not do these latter steps; luckily, our models seemed promising enough even without them.

When training models on unstructured data, it is also common to inspect some classification errors manually -- to get a sense of what the model is doing wrong, or what instances may be mislabelled. By just having embeddings, we could not do this (i.e., we couldn't print out the images that were misclassified). Instead, we took the slightly longer journey of logging into our systems to inspect a few examples--this falls under all of our regular access controls and protections, so it is safer.

## 🚢 Going back to production

At the end of the previous step, we now had _two_ models: the pre-trained encoder model, which was already in production (as its own microservice), and the new shallow model which was classifying the outcome we were trying to predict.

The pattern that we typically follow here is to build an _orchestrator_ service. Under the hood, given a new instance of the unstructured data, the orchestrator service would (a) call out to the encoder service, to retrieve the embedding from the raw data, (b) send that embedding over to the classifier service, to get the prediction, and then (c) respond to the caller with the prediction.

This orchestrator pattern is increasingly common for us, and has three main benefits:
1. It hides all of the implementation detail of what the machine learning system is doing under the hood, and teams we pair up with just see an API where they send over some unstructured data and get back a prediction;
2. This design enables us to make extensive use of shadow mode deployments to evaluate our new models; this is a technique, that I have written about [before](http://nlathia.github.io/2020/07/Shadow-mode-deployments.html), where promising models are put into production but their predictions are not acted on while the models are being evaluated;
3. Orchestrators are the ideal place to implement extra monitoring and business logic. This was another area where we could add in controls, to make the system safer.

## ❔ Can embeddings be reversed?

The goal of this approach was to enable our team to train ML models using protected unstructured data. We made a number of trade-offs, but this approach let us do that.

One question that comes up is whether it is _technically possible_ to reverse engineer an embedding back into its original input. I was pointed to "Information Leakage in Embedding Models" as an example (it's available [here](https://arxiv.org/abs/2004.00053); thanks, [Adam](https://twitter.com/oliner)). This is a research paper from August 2020 that indicates that this is somewhat possible for text: "we show that our attacks on popular sentence embeddings recover between 50%–70% of the input words." I have yet to find a similar example for images -- if you know of any relevant research, please send it my way.

In our case: we do not release embeddings (or any data, for that matter) as public datasets, we have access controls in our data stack that will monitor who is reading different data sources, and reverse engineering these embeddings would be a huge amount of work. This is not to say that we won't keep an eye on this space!

## ✅ Embeddings stores

The goal of this work was to enable us to keep customer data protections at their highest standards while enabling us to train and evaluate a machine learning model.

Solving for this specific ML problem, given the constraints we were working with, involved splitting up what is generally viewed as an ML-only problem (fine-tune a model) into a system design problem. That's the biggest lesson we're taking forward, and we regularly ask this question today: how can we break up a big ML problem into smaller, more manageable components?

The main trend I see from this system is that embeddings are an increasingly valuable part of our ML stack -- we see them everywhere these days. As we continue adopting this approach, we're now seeing a bit more complexity. For example, we have now started experimenting with different encoders, and so need to keep track of _which_ encoder is suitable for what problem, and which encoder each downstream model is expecting embeddings from.

Much more to come in this space 🚀

