---
layout: post
title: "Why do we write machine learning code?"
description: The line between "data science" and "production" code doesn't cut it.
categories: [machine-learning]
---

> Note: this post is part of a new project called Operator.ai. You can read my posts about that [on substack](https://operatorai.substack.com/).

In the last few weeks, my team at Monzo has been tackling the “classical” flavour of machine learning problems: training supervised models on tabular (and highly imbalanced) data. After a win earlier in the year with a model that detects the likelihood of a customer being a victim to [impersonation fraud](https://monzo.com/blog/police-impersonation-scam-phone-call), we’ve been exploring our ability to train models that can detect other types of payment fraud 🚔 .

Unlike problems with a pre-defined dataset — the kind you will find on Kaggle — majority of the work my team is iterating on entails analysing data, defining and understanding features, and training models on different slices of data. Most of the things we were trying were not working, until we hit a promising break-through last week — we’re now digging into it, to make sure that it is not a red herring.

This type of work got me reflecting on the recurring debate around Data Scientists writing “production” code, and the many efforts underway to help bridge that gap.

## We write code to understand a problem

A lot of the code we’ve been writing recently is going to end up being deleted — _and that is 100% okay_. This includes queries to create features that don’t end up working; models that we train that don’t perform well, and ad-hoc scripts that we need to create plots or summarise results.

While I usually find myself agreeing with all the points about poor Software Engineering practices in Data Science (as brilliantly captured in the “[I don’t like notebooks](https://docs.google.com/presentation/d/1n2RlMdmv1p25Xy5thJUhkKGvjtV-dkAIsUXP-AL4ffI/edit#slide=id.g362da58057_0_1)” presentation), I usually do advocate for the quick & dirty when problems are undefined. And, in machine learning, few problems are as undefined as “predict this label, using any data that we have.”

In these cases, what we want to keep is the insight we get into problems — and that insight is rarely just captured in the code we write. It ends up in people’s heads. And, even then, after you’ve trained 25 models — how do you remember what worked, or what direction to go next? Our daily stand-ups had indeed turned into a brainstorming session for things to try that day.

To tackle this, my team has resurfaced the concept of “research journaling” which a few of us used to do in our previous lives in academia: time-sorted documents that describe what we’ve done, what we want to try next, and what (didn’t) work.

I think that this flavour of code-writing is what is fueling the whole debate of Software Engineering practices in Data Science. When I’ve worked on systems that do not use machine learning, we did not write code to understand the problem. For these problems, we need to — and the only tools that exist for us to keep our insights are documents and spreadsheets.

## We write code to ship a system

The second flavour of code writing we do is implementing the features, model training pipelines, and micro services for our production system. I’ve continued talking to a variety of companies who are marketing products for teams like mine — many of those that are coming my way are building feature stores — and this seems to be the arena that they focus on.

The pitch that I have heard several times is along the lines of “_write your code once_” — i.e., write code that can be used both to explore a problem and to ship its solution to production. However, a conversation I had with one of our Staff Engineers a few months ago regarding this topic has stuck with me.

He works in the lending side of the business, where accuracy is paramount. I was building a feature store, which would enable us to implement features (once) in our analytics stack, and serve them in production.

When the idea of writing code once came up, he shared with me that writing it twice was actually one of their most useful levers for ensuring that it was correct (his actual words were something like “the types of errors that you can make when writing Go are very different from the types of errors you can make when writing SQL”). We ended up using that to define when a feature store would be a useful tool, and when it would not.

Both of these types of code-writing (to explore and to ship) are, therefore, radically different from each other — and perhaps, while there is room to make “data science code” more like “software engineering code,” there may also room for us to do the opposite too.

## Updates to modelstore

The last time [I wrote about modelstore](https://operatorai.substack.com/p/releasing-modelstore-v001b-two-opinions), I had just released version 0.0.1. It has been about two months! As this pandemic continues to rage on, I’ve been trying to do one thing with it each night — no matter how insignificantly small that one thing is. I can’t say that I’ve always been able to.

The library is now at [version 0.0.3](https://pypi.org/project/modelstore/); here are some brief updates!

* It now supports transformers and tensorflow;
* The main two lines (create & upload an archive) have been reduced to one line (upload a model — thanks for the feedback, [Julien](https://twitter.com/julien_c)).
* The library has been tested across Python 3.6, 3.7, and 3.8.
* It now has [a shiny new website](https://www.operator-ai.com/) which will become a future home for more information about models.

There are a number of parts that I’m thinking about next — specifically around [model cards](https://modelcards.withgoogle.com/about), adding insight to models, and making them all [searchable, sort-able and discoverable](https://discuss.huggingface.co/t/announcement-model-versioning-upcoming-changes-to-the-model-hub/1914/12?u=nlathia).

## Hanging out online

Want to share your thoughts or discuss these tools? You can find me [on Twitter](https://twitter.com/neal_lathia), in the [MLOps Community](https://mlops.community/) and the [Data Talks Club](http://join.datatalks.club/) slack. 

