---
layout: post
title: "Releasing modelstore 0.0.5 and the operator CLI"
description: Originally published on substack.
categories: [machine-learning]
---

> Note: this post is part of a new project called Operator.ai. You can read my posts about that [on substack](https://operatorai.substack.com/).

👋 Hello, subscriber! It has been decades (well, months) since I last wrote an update here on Substack. So here is a post with two quick updates!

## 1️⃣ modelstore 0.0.5 is out: want a free API key?

A model store is an essential building block of your ML Ops stack: it’s a tool you use to version, store, and organise your machine learning models and easily get them into production.

In September 2020, I released the first version of a model store Python library. The updated version, which [you can find on github](https://github.com/operatorai/modelstore), has been released 🎉 — here are a couple of highlights:

* It now supports nine ML libraries (Catboost, Keras, LightGBM, PyTorch, PyTorch Lightning, Sci-Kit Learn, Tensorflow, Transformers, and XGBoost)
* Too much hassle setting up and managing your own storage? Modelstore now has a hosted storage option that only needs an API key ID & secret access key.
* Capturing meta-data about models has been bumped a bit too: the library now pulls out data about model parameters.

There’s more to come!

🎁 As a subscriber of this mailing list: get in touch with me and I’ll give you an API key ID & secret access key for this version of the library — no cost. You’ll be able to start using the tool without managing any storage, be the first to get new features that are being cooked up using the data from models that are uploaded there, and help shape its future!

## 2️⃣ the operator CLI: cookiecutter on steroids

I built the hosted storage & API for the modelstore library using a combination of Lambda functions, S3, and DynamoDB. At least, that is what I intended: in practice, I needed to get my head around API gateways, IAM roles, and more. Why is this so hard, and so manual?

To make my own journey faster, I built the operator CLI tool, which is [now open source on Github](https://github.com/operatorai/operator) and can be installed via brew.

The first place I shared it publicly is on the [Data Talks Club Slack community](https://datatalks.club/); Alexey Grigorev gave it the “[cookiecutter on steroids](https://www.linkedin.com/embed/feed/update/urn:li:ugcPost:6762994584785092608)” tag line, which has now stuck 😇 and was echoed by Demetrios Brinkmann when he featured it in the [ML Ops Community’s](https://mlops.community/) New Tool Tuesday [mail out](http://autodb.activehosted.com/index.php?action=social&chash=43ec517d68b6edd3015b3edc9a11367b.98&s=c2c6b31ab2be1bd19095d70e73326b69). ( ➡️ by the way, you can find me on both of those slack communities)

Here’s a small video of the operator CLI in action!

<iframe width="560" height="315" src="https://www.youtube.com/embed/Np6Bt8SewS8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

🤔 In case you were wondering — yes, the name does come from The Matrix, where the protagonists can just call up an operator when they need some extra firepower or want to learn kung fu 🥋

## 🎉 That’s it!

I have continued spending a good chunk of my free time talking to companies about how they are tackling machine learning and ML Ops today — as one friend put it, many have been “telling me about how the sausage is made” 🤮 . The diversity of approaches, capabilities, and outcomes is huge; much more than I could effectively summarise in this post. ☎️ If you want to jump onto a hangout to chat about ML Ops at your company, feel free to reach out.

One more thing: if you want to hear me speak a bit about ML while wearing my Monzo Director hat 🎩 — I’ll be [speaking at London.AI](https://www.london.ai/) in a couple of weeks. I hope to see you there 🙌
