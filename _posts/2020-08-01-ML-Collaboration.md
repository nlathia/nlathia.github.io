---
layout: post
title: "Software Engineering 2.0"
description: An architecture we used to parallelise work on one problem.
categories: [tech-lead, monzo]
---

If you've ever participated in the design of a software system, you may have spotted that the way that these systems are typically designed enable individuals and teams to work **in parallel** to build them.

The system may be sliced up as front/back-end, client/server, or as several server-side components that talk to or layer on top of each other. Many times, these bits can be drawn with boxes and arrows on a whiteboard, and we have names for the roles who specialise in building certain types of boxes (Backend, Mobile, Web Engineer).

The tech world has been learned so many things about _how_ to build systems that it now produces companies with _thousands_ of people who can work on building large scale software systems together-- and who collectively refer to their discipline as [software engineering](https://research.swtch.com/vgo-eng).

> Software engineering is what happens to programming when you add time and other programmers.

## Enter Software 2.0

Machine learning, or "[Software 2.0](https://medium.com/@karpathy/software-2-0-a64152b37c35)," changes many things about programming. A recent highlight was a colleague who, after training his first model, told me "I used to be able to go home at the end of the day, knowing that my code worked." 😅

Aside from the complexity of machine learning itself -- the maths, models, and recent advances -- machine learning is also breaking everything that was common practice in Software Engineering.

ML today is broadly pitched as a **sequential** process, covering steps that do things to extract, load, and transform the data, steps that train and validate models, and steps that ~~draw the rest of the fucking owl~~ put the model [into production](http://veekaybee.github.io/2020/06/09/ml-in-prod/#the-mystery-of-deploying-ml).

This sequential workflow is also echoed in common job titles: Data Engineer (the ETL steps), Data Analyst (discovery & insight), Data / Machine Learning Scientist (model training and validation), and Machine Learning Engineer (model deployment). Even the Google Cloud Platform's [website](https://cloud.google.com/ai-platform) depicts the process as a line:

<img src="{{ "/assets/gcp-ml-workflow.png" | prepend: site.baseurl }}" alt="Screen shot from the Google AI Platform website showing the ML workflow."/>

In doing so, _machine learning_ methods are running amock from the established practices that enable teams to work, in parallel, on building systems.

## We're back to waterfall

Without having any established patterns for _teams_ to work together on building ML systems, I've seen many folks revert back to some kind of [waterfall](https://en.wikipedia.org/wiki/Waterfall_model) process: projects are split up into a "training phase" and a "productionising phase." The former requires a lot of data analysis and modeling. The latter can't happen until the former is "ready," and often happens with an actual handover from one team to another. In some cases this also means re-writing everything from the first phase (which may have been written in a "non-production" language) into a different programming language.

It's odd to think that a flavour of waterfall is back. The waterfall model was broadly abandoned because it was inefficient and lead to poor outcomes; and yet, it's not uncommon to hear of it applied again in ML--I wonder how many projects are failing because of this. 

## We collaborate by competing

The second pattern I've seen is having multiple folks work on developing their own model over a shared dataset and objective. This is the pattern that Kaggle [pitches](https://www.kaggle.com/c/about/host/) to prospective competition hosts: multiple people can work on a problem this way, once a dataset has been prepared and an outcome agreed on. I've seen this approach mirrored inside of companies as well.

Collaborating by running competitions is a form of _destructive parallelisation_. Having 5 people train models on a shared dataset to find the _best_ one does not imply that you will put 5 models into production. From a lines-of-code perspective, this pattern results in throwing away everything except for the "winner's" model. The only collaboration that happens is when individuals share their insights, code snippets, and failures with each other.

Imagine if the same was true for building a mobile app with 5 people: if the only way you could do this was to build 5 mobile apps and then pick the best one: this would sound like lunacy. And yet we do this in machine learning 🤔

## We build new types of monoliths

As far as I know, [Andrej Karpathy](https://twitter.com/karpathy), who directs AI at Tesla, coined the term "Software 2.0." If you jump to 18:25 of [this presentation](https://www.youtube.com/watch?v=IHH47nZ7FZU) he gave at ICML 2019, he discusses the problem of getting teams to collaborate when working on the "beast of a [neural] network" that powers a self driving car.

In this specific system, the entire car drives using a single neural network, which has a shared backbone and multiple different heads that learn different tasks (so training this model falls under "multi-task learning"). Behind the scenes, different teams "own" different parts of the network, which are responsible for different tasks.

A fictitious example of collaboration going wrong that he describes in his talk is one team changing the oversampling rate of "their" task (traffic light detection) and this impacting the performance of another team's task (moving object detection). He mentions having to deal with the "political drama" when different teams make changes that have unintended impact on others.

This ML system (while hugely impressive and likely the state-of-the-art) sounds like a [monolith](https://en.wikipedia.org/wiki/Monolithic_application): it's a system which can't be broken down into components that are truly independent of one another.

Software monoliths are perfectly adequate for some applications, but one of the reasons companies large and small had been moving away from them is that they do not faciliate agility and collaboration. There are many posts ([here's one](https://www.mulesoft.com/resources/api/microservices-vs-monolithic)) that go into the "monolith vs microservice" debate, which I won't reiterate; I'm also not arguing that a self driving car _should_ be built with microservices. We're simply back to a place where systems' designs do not easily lend themselves towards having more time and programmers. 

## So what else can we do?

At the London PyTorch meetup last year, I briefly described a system architecture that was behind one of the machine learning systems that we shipped, and how that enabled multiple people to contribute towards the same problem.

The basic problem (full slide deck is below) was a multi-class text classification problem, where we had fewer than \~20 classes. We wanted to test something with customers quickly, and so we started by training a model that aimed to detect one of those classes. It threw up all of the usual nuance of ML projects; for example, the data quality wasn't quite what we expected. But we managed to iterate on this binary classifier quickly and ship something which showed a lot of promise.

When it came to scaling up, we didn't want to throw away all of the work we had done so far. Therefore, instead of training a _single_ 20-class classifier, we trained 20 binary classifiers--one per class.

All of these classifiers were shipped as separate microservices, hidden behind a single entry point (the "orchestrator"). Each time the orchestrator received some text input, it would query all 20 models and return a "winning" topic by selecting the model that had the highest probability.

The benefits we saw of this approach were:
* Incremental delivery: instead of putting a product squad on hold while we trained a huge multi-class classifier, we were able to regularly ship a new "topic" in our system.
* Constructive parallelisation: instead of having teams compete to train the "best" model, we were able to split up the work (by class) and train one each.
* Easier evaluations: understanding the offline performance of a binary classifier is much more straightforward than having to consider a 20x20 confusion matrix -- which helped accelerate us to know when they were good enough.
* No unintended side-effects: adding a new topic into the system did not change the previous classifiers; we didn't observe any of these classifiers interfering with one another.

A natural question to ask is whether all of this work produced a _worse_ model overall. Once we had validated this system in product experiments, a Scientist in my team ran offline experiments comparing those models with a single multi-class alternative: the differences were negligible (in some classes) or worse (in others).

### Why I wrote this

The top of this blog post has the "Software engineering is what happens to programming when you add time and other programmers" quote. There are many interesting things about ML--but the most exciting bit for me is about turning its potential into real systems. And the only way to achieve that is to have both the tools and methods that we need; it seems that the latter is still in its infancy.

Since giving the PyTorch London presentation in October 2019, I've heard that other companies have adopted this model orchestration approach, so thought to share it more widely. If it's useful for you too, let [me](https://twitter.com/neal_lathia) know. The full presentation is below, and the subject of this post is from slide 22 onwards.


<iframe src="//www.slideshare.net/slideshow/embed_code/key/NFnCQv2LUK5Cy0" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/neal.lathia/using-language-models-to-supercharge-monzos-customer-support" title=" Using language models to supercharge Monzo’s customer support" target="_blank"> Using language models to supercharge Monzo’s customer support</a> </strong> from <strong><a href="https://www.slideshare.net/neal.lathia" target="_blank">Neal Lathia</a></strong> </div>