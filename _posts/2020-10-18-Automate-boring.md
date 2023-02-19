---
layout: post
title: "Automate the boring parts"
description: We're hiring! Here's an FAQ post with all the typical questions that I receive.
categories: [monzo, tech-lead, machine-learning]
---

About a week ago, I posted this question on the MLOps community Slack:

![](https://nlathia.github.io/assets/posts/2020-10-18-Automate-boring/slack-screenshot.png "MLOps Community Slack post")


The thread had some interesting answers — the common, and unsurprising, theme being Python microservices deployed in different types of infrastructure (kubernetes seems to be the most popular choice).

## A microservice is 90% boilerplate
Monzo is a bit infamous for its microservices: we have over 1,500 of them, and my team owns (or co-owns) 37. Our microservice network isolation data makes for pretty graphs 😍 and a lot of tweets —

![](https://nlathia.github.io/assets/posts/2020-10-18-Automate-boring/monzo-graph.png "Monzo microservices graph")

The main thing I have learned by working on this code base is that microservices are mostly boilerplate code. Wikipedia gives us a handy definition —

> In computer programming, boilerplate code or just boilerplate are sections of code that have to be included in many places with little or no alteration.

For microservices, this means things like Dockerfiles, Makefiles, liveness and readiness probes, and more: when creating a new service, the actual business logic is the minority part of the code. Some Engineers go so far as merging in the boilerplate before actually starting their work!

## Writing boilerplate is a productivity killer
My Medium feed is absolutely rammed with “how to deploy a machine learning model using Flask” posts. They all describe what Flask is and walk readers through the process of writing a handler function from scratch to serve machine learning model predictions.

This is a great starting point, if you’ve learning or have never done this before — but if shipping machine learning models is your job, then having to write boilerplate code over and over again pulls you away from focusing on the core part of the job: the machine learning bit.

## Templating brings speed and uniformity
At Monzo, we have tools that generate boilerplate code for our Go services and protobuf schemas. For Python, we’ve taken the somewhat classical approach of creating a cookiecutter-based template. Not only does that speed up our development process (creating a new Python service ~ cloning a template), but it makes all of our code uniform.

I cannot overstate how impactful these simple templates and tools are. Being able to jump into someone else’s code and have a high-level intuition about what goes where without having to read any documentation lies at the heart of a productive team — and developers who have a great experience give you a competitive advantage.

## Early release: a CLI tool
Over the last few weeks, I’ve been working on a new command line interface (CLI) tool that tailors these concepts specifically for machine learning.

Deploying a machine learning model for live inference entails:

* Creating a directory for your code, typically with a Python virtual environment;
* Writing code that: (a) loads model, (b) receives requests via an HTTP handler, and (c) makes predictions using the model, and finally
* Shipping that code to the platform of your choice.

To make this exercise simpler, I decided to use pyenv and pyenv-virtualenv for virtual environments (because that’s what I use), use Flask as a webserver (because it is popular), and to look into Google Cloud Functions and Cloud Run containerized applications as ‘platforms’ (we can have a separate discussion about whether companies of the future will even need to run their own kuber-nets, given how commoditized the as-a-service versions of these are becoming).

The parts that I left unfinished are those “best” bits — the function that loads the model, and the function that returns a prediction from it. The rest of the boilerplate is all there by default.

The result looks like this — ⚠️ with the usual warnings: (1) you are amongst the first people to even hear about this, and (2) I’m assuming you already have installed the Google Cloud SDK and the pyenv tools.

### 🏗 Install

```
❯ brew tap operatorai/tap 
❯ brew install operator
```

### ✅ One-time, global setup

```
❯ operator init
[...]
Use the arrow keys to navigate: ↓ ↑ → ← 
? Deployment type:
  ▸ Google Cloud Function
    Google Cloud Run
```

### 🏭 Create — this gives you all the boilerplate

```
❯ operator create service.hello-world
🛠 Initialise — to create a pyenv virtual environment

❯ cd service.hello-world
❯ make install
🛫 Launch it locally

❯ make localhost
```

### 🚀 Deploy!

```
❯ operator deploy .
```

With this setup, I’ve been able to deploy a Cloud Run containerized application in minutes. In fact, majority of the time it takes boils down to installing requirements and building containers!

I would love for you to try out this tool
A good place to start is the tool’s README file. The entire tool is open sourced here.

Let me know what works or what is broken. Let me know what else you would like to see it do. Let me know why you (wouldn’t) use it. Ask me what I think about “no code” model deployments (hint: 🙄) or let’s chat about Hashicorp’s Waypoint, which looks similar in spirit.

