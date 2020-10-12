---
layout: post
title: "You've trained a model. What's next?"
description: Originally published on substack.
categories: [machine-learning]
---

> Note: this post is part of a new project called Operator.ai. You can read my posts about that [on substack](https://operatorai.substack.com/).

In this post, I’m going to zero in on the one of the smallest first steps:

# What do you do with your model artifacts?

I’ve come across many different answers here. Teams that use git lfs, cloud storage buckets, databases, and others that use email or Dropbox 😲.

Every organisation that I’ve come across, while at different stages of their own journey with machine learning, is using a slightly different ad hoc approach. I’ve built and re-built ways of doing this myself.

I would love to hear about how you do this. Feel free to hit reply and share your war stories, or jump into [this Google form](https://forms.gle/zjYeeZtFJiMhceEs9) if you wish to remain anonymous 👀

# Model Stores

Under the hood, what we’re talking about here is how you [manage your ML assets](https://www.slideshare.net/paulvermont/2018-data-engineering-for-ml-asset-management-for-features-and-models), a topic that — apart from this [one exploratory analysis](https://arxiv.org/abs/1905.10677) I found — does not qualify as sexy enough for academic research.

In the open source world, there are various projects that I’ve come across — but never been sold on using. They enable [saving scikit-learn models](https://github.com/SohamPathak/modellogger.github.io), track [ML versions and experiment meta-data](https://github.com/VertaAI/modeldb), [decouple themselves](https://github.com/src-d/modelforge) from the libraries that we are so intimately familiar with, or [leave it up to you](https://github.com/datmo/datmo) to export the model itself.

There are some companies who are stepping into this realm, in their own way. Hugging Face has [an open model store](https://huggingface.co/models) of NLP models; DVC [enables storing models](https://dvc.org/features) using their command line tool; Google announced it will start testing a [managed service for ML assets](https://cloud.google.com/blog/products/ai-machine-learning/key-requirements-for-an-mlops-foundation) by the end of September. It’s a problem we all have!

# 🔜 What do you need in a model store?

Last week, I spent some days off starting a Python model store library; the kind that I always wished I had. To change up from my usual lock-down routine, I even sat on a different side of the table I usually sit at while I work from home 😅

Here is your chance to input into its initial design — I would love to hear about how you manage your ML models. Feel free to hit reply, or jump into the Google form!
