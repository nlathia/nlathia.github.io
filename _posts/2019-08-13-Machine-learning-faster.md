---
layout: post
title:  "Machine learning, faster"
tags: [opinion, monzo]
excerpt_separator: <!--more-->
---

I recently gave a couple of conference presentations about how we are thinking about _speed_ when developing machine learning systems at Monzo. This post covers some of the background to the points I was making in my talk, as well as what we're doing in the Monzo machine learning team to speed up our own work.
<!--more-->

Speed is not a word that is regularly associated with machine learning teams. When we talk and write about accomplishments in machine learning, there is often a focus on the problem, the algorithmic approach, and the results - but no mention of the time that it took to get there.

### Does speed matter in machine learning?
I remember once speaking with a machine learning researcher at a large company who was hosting my visit. He told me that a product team had approached him with a very exciting idea that had to do with text summarisation. He started looking into the problem and made some very significant contributions over the course of 12 months - going so far as publishing papers in top-tier conferences about the topic. I asked him if his ideas made it into the product in question. Unfortunately, the answer was no: by the time his research was completed, the product team had moved on from this problem, and weren't interested in having the solution anymore 😭.

I've heard many variants of this story, that captures a misaligned pace of work between product and machine learning teams. Ultimately, this leads to machine learning research never making it out of the lab. And yet, the best measure of _impact_ for machine learning, if you work in a non-research institution, is whether you can use it to help your customers - and that means getting it out of the door.

Speed matters. This goes beyond thinking about minimum viable products (and the ML equivalent of "use a logistic regression before you use a neural network"); this is about the speed of the entire lifecycle for building machine learning systems. There are four angles to this that I covered in my talk, relating to speed:

### 1. Speed of deployment
Quickly deploying models to production is one of the biggest roadblocks for impactful machine learning. In many companies, this boils down to _who is trusted_ to do this work; often, Machine Learning _Scientists_ design and train a model, and then hand it over to Machine Learning _Engineers_ to put it into production. This implicitly develops a "throw it over the wall" mentality: people who train models do not have to think about how complex it would be to ship, and folks who ship models may be given the additional responsibilities of translating models from one language to another or having to demonstrate that what the performance of what they have shipped matches back with what was trained. The most common complaint I've had from _Scientists_ is along the lines of "I trained this model months ago and I'm just sitting here waiting for it to be shipped," and _Engineers_ retort that they get no recognition for doing all of the hard work of enabling production inference to actually happen.

At Monzo, Machine Learning Scientists deploy their own models. The goal that we set ourselves is that if you can write a `predict()` function for a machine learning model, you should also be able to **safely** deploy a model to production. To enable this, we've built a `cookiecutter` template microservice (that uses `Sanic` under the hood) that Machine Learning Scientists use: it guides them through a small set of options (e.g., "which ML library are you using?") and then creates everything they need, minus the `predict()` function itself. These can be deployed using the same command line utility that all Monzo engineers use to deploy non-machine learning services. We can now build and deploy a service in a matter of hours - right after we finish training a model.


### 2. Quickly validating misbehaviours
Quickly validating minor issues with machine learning models in production is nearly impossible.
* When I search for X, where is Y?
* Diagnosing the problem via unit testing = impossible
* Validation testing - slack integration
* Most times it's the pipeline, not the model

Keeping track of the online performance of machine learning models is going beyond what we traditionally do when deploying software.

### 3. Quickly repurposing models for new problems
* We had an existing system for giving COps suggested answers
* There was a period where a massive inbound demand was straining the entire customer operations team.
* Can we redirect a subset of topics to a different queue?
* Typical approach may be transfer learning or training a new model
* We wrapped our suggested responses in `if` statements to redirect queries to different queues
* Deployed this in less than a day

Combining a rule engine over an existing model created a new decision system. Rule engines & ML can coexist!

### 4. Measuring time-to-results, not results
To increase your success rate, double your failure rate (& get there in half of the time)

* How can we quickly evaluate new state of the art machine learning?
* 2018 was a transformative year for NLP - ELMo, ULMFit, BERT.
* Completely split out the process of generating a clean, well-formatted, labelled dataset from any learning code
* Create plug-and-play Colab notebooks for algorithms
* Focus on time-to-results and not on the specific results of the idea
* How quickly can someone else use templates to look into a new problem?


### Conclusions
* Deploying, valildating, reusing, templating
* Adopting the best practices from software engineering, tweaking the ones that do not work for machine learning
* Research time is well spent if we get some tools (bonus if we get results)
* Always a work in progress

You can find the slides from my talk [here](https://www.slideshare.net/neal.lathia/machine-learning-faster); reach out [on twitter](https://twitter.com/neal_lathia) if you have any thoughts!