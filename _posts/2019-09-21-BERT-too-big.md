---
layout: post
title:  "Shipping large transformer models"
tags: [opinion]
excerpt_separator: <!--more-->
---

Here are some thoughts on the recent discussions around transformer models being too big to put into production, and a dive into how we have shipped them at Monzo using the [HuggingFace library](https://huggingface.co/).
<!--more-->

## 💬 Background

Over the last couple of years, there have been a ton of exciting developments in natural language processing (NLP). In case you haven't been working in this area, here's the crash course: the development of [deep pre-trained language models](http://ruder.io/nlp-imagenet/) has taken the field by storm. In particular, [transformer architectures](https://arxiv.org/abs/1706.03762) are everywhere, and were popularised by Google's release of the [**B**idirectional **E**ncoder **R**epresentations from **T**ransformers](https://arxiv.org/abs/1810.04805) (BERT) model, OpenAI's release of the [GPT(-2) models](https://openai.com/blog/better-language-models/), and other similar releases.

Various research teams are continuing to compete to train better language models; if you look at the [General Language Understanding Evaluation (GLUE)](https://gluebenchmark.com/leaderboard) benchmark leaderboard, you'll find a host of other approaches (many of them also named BERT: ALBERT, RoBERTa, etc.). The overarching trend in this research has been to train **bigger** models with **more data** - growing to the extent that researchers [have investigated](https://arxiv.org/abs/1906.02243) the costly carbon footprint of training these large networks.

For practicioners, the main selling point of pre-trained language models is that you do not need to start from scratch when developing a new classifier: you can fine tune a pre-trained model and often get state-of-the-art results with a fraction of the work. But as these models continue to grow in size, folks have started to question how useful they are in practice. For example, this quote in [a blog post](https://explosion.ai/blog/spacy-pytorch-transformers) from the explosion.ai team caught my eye:

> In a recent talk at Google Berlin, Jacob Devlin described how Google are using his BERT architectures internally. **The models are too large to serve in production, but they can be used to supervise a smaller production model.** 

Unfortunately, it looks like this talk [was not recorded](https://twitter.com/honnibal/status/1157592067712966657), and so all of the context around this claim was lost. In light of that, this post gives an overview of how these models _can_ and _have been_ put into production.

## 🚢 Patterns for models in production

Let's begin with a very pragmatic question: **what is "production?"**

For our purposes, production is the environment where we put software that we have written (or a model we have trained) so that it can enable features in a product to work without any manual intervention. By this definition, we exclude any code that we use for analytics or ad-hoc purposes, even though there may be potential applications of NLP in those domains (e.g., sentiment analysis on historical data). I'm also assuming that this environment is designed using [microservices](https://en.wikipedia.org/wiki/Microservices) -- which just so happens to be how the [Monzo backend is designed](https://monzo.com/blog/2016/09/19/building-a-modern-bank-backend).

There are three main ways that models can be used in production:
1. **RESTful Services**. This is the first (and sometimes only thing) that comes to mind when folks talk about "production." The idea is to build some kind of microservice with an API which can receive requests, do some work, and return a result. For example, when a customer types a query into the Monzo app's help screen, we have a service that receives that request and returns relevant help articles (Disclaimer: that has been simplified a bit. We have quite a few services that are involved in this work, but the idea is the same).
2. **Consumer Services**. The second approach is to build a service which listens out for certain events requests for some work to be done when they happen. For example, when a customer starts chatting with our customer support team, we have a service that is listening for particular events in order to trigger recommendations that are shown to the agent for saved responses that may be relevant to the current query.
3. **Cron Jobs**. These are batches of work that need to be done on a regular basis. For example, we store all of the help articles and agent responses in a content management system - and these are regularly edited and updated with new content. Our search and recommendation services use the _embeddings_ of this content: we therefore have cron jobs that regularly run, encode all of the text and store the embeddings so that they can be used when needed.

In practice, building an end-to-end system is likely to involve more than one of the above. I've already mentioned the system which gives our agents response recommendations: this system has a cron job (to encode all of the response text), a consumer service (which decides when recommendations should be triggered), and a RESTful service (which is, effectively, a k-Nearest Neighbour between the encoded customer text and the encoded responses).  

## 🙅‍♂️ When is a model too big?

**The model doesn't fit in memory**. The main question here is about reconciling the hardware where you want to run a model with the size of the model. The current models are not a big problem in cloud-based backend systems, which have a variety of different instance sizes available. This changes if you want to want to ship a model elsewhere (for any other reason). For example, [this ICML workshop talk](https://slideslive.com/38917690/multitask-learning-in-the-wilderness) by Andrej Karpathy describes a large multi-task neural net that needs to run in a car, or folks at Google are investigating [federated learning](https://ai.googleblog.com/2017/04/federated-learning-collaborative.html) in order to distribute model training across mobile phones. This is part of a broader movement that is pushing machine learning towards "edge" devices (like mobile phones), which are much more resource and energy constrained.

**The model is too slow**. As models get bigger, inference time also grows (and, perhaps, they have been shipped on non-GPU instances) - and at some point this may be "too slow." To get to the heart of this, it's first worth diving into **when speed matters** in relation to the three patterns above. For example, inference time in cron jobs is usually not such a big deal; it is batch work that needs to be run on a schedule, rather than run with a deadline. 

In all of these, the prediction time for BERT is small/doesn't matter, compared to the full

Speed
* Horizontal vs. vertical scaling

## 🤗 Shipping transformers

Huggingface in production
* Loading BERT before the service starts receiving requests
* Async loop for predictions
* Minor details: PyTorch threads, Sanic threads

## 🔍 Final thoughts on research

Other thoughts
* Breaking up a neural net into multiple services (too much complexity for now)
* Distilling models is still very valuable research
* Recent research on making bigger & smaller models
* ML on the edge
