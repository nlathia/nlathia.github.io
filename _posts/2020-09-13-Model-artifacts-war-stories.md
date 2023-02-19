---
layout: post
title: "Model artifacts: the war stories"
description: Originally published on substack.
categories: [machine-learning]
---

If you were around for <a href="https://nlathia.github.io/2020/09/Model-artifacts.html">my previous post</a>, I started out by asking about what you do with your model artifacts after you’ve trained a model — when starting the journey to production. A day later, [I asked the same question on twitter](https://twitter.com/neal_lathia/status/1301927567730057217):

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">❔Folks who are training models at work: how do you manage your model artifacts? </p>&mdash; Neal Lathia (@neal_lathia) <a href="https://twitter.com/neal_lathia/status/1301927567730057217">September 4, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

Here are some snippets of what I’ve learned so far.

## At an early stage, models are managed manually

Google Drive. Blobs in s3 and Cloud Storage. A raft of Docker containers. Spreadsheets to know which one is where. When someone said “this has always been a struggle,” I felt their pain.

There are definitely two modes here: (a) managing models during experimentation, to compare them to each other and pick the “winner” and — sometimes separately — (b) figuring out what to do with artifacts that need to be shipped to production.

➡️ I’d love to see some page view stats for the AWS boto3 and Python google.cloud docs — I’m sure we’ve all hung out there several times.

## Many folks end up building a model store

There are some pretty awesome sounding systems out there. Here’s an example from Luigi (who, by the way, runs <a href="https://mlinproduction.teachable.com/p/build-deploy-and-monitor-ml-models-with-amazon-sagemaker">this course</a> on Sagemaker).

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">We built a model storage solution with Postgres + s3 and an API on top of this. Our internal model training lib calls the API to store the model artifacts on s3 and add entries to the db that track metadata. Lets us leverage library-specific storage through a generic interface.</p>&mdash; Luigi Patruno (@MLinProduction) <a href="https://twitter.com/MLinProduction/status/1302264832188653571?ref_src=twsrc%5Etfw">September 5, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

Similar examples mentioned Cassandra, BigQuery, <a href="https://www.ibm.com/garage/method/practices/deliver/tool_nexus/">Nexus OSS</a>, <a href="https://docs.metaflow.org/introduction/what-is-metaflow">MetaFlow</a>, creating pip-installable packages, and more. Some great stuff! But when <a href="https://twitter.com/HamelHusain/status/1304087175781261314">Hamel said</a> that he’s currently “stuck in the other 95% of Data Science” it reminded me that many teams out there are doing their jobs <strong>and</strong> building the enablers they need to do their jobs. Put another way, they’re <a href="https://tenor.com/view/wallace-and-gromit-train-tracks-work-swift-fast-gif-3793283">laying the tracks ahead of the train</a>.

➡️ It struck me that, in particular, everyone’s build of this type of system needs them to reimplement _serializing_ models into files.

## “We use &lt;insert company&gt; for everything”

Finally, there are some companies who got regular shout outs, such as <a href="https://www.wandb.com/artifacts">Weights &amp; Biases</a>, <a href="https://databricks.com/product/mlflow-model-registry">Databricks’ MLFlow</a>, <a href="https://docs.microsoft.com/en-us/azure/machine-learning/concept-azure-machine-learning-architecture">Azure ML</a>, and <a href="https://www.pachyderm.com/">Pachyderm</a>. I have not used these directly, and am investigating further — so far, it appears that I would need to start, each time, by understanding their fundamental abstractions.

➡️ With so many _end-to-end_ ML platforms popping up, I’m reminded of _enterprise software._ Well, I’m not old enough to have lived through that myself 😅 but it sounds similar.

## An early peek 👀

Based on what I’ve seen — and what I’ve experienced — I’m finishing up a simple Python library to cater for those early stage teams who want to start managing _their choice of models_ in _their choice of storage_. This can be the first step towards getting those models into production!

Here’s a sneak peak of what it currently looks like:

![](https://nlathia.github.io/assets/operatorai/modelstore-screenshot.png "A screen shot of modelstore's code")

Hidden, under the hood, is:

* A common interface over any kind of storage, starting with: file systems, GCP cloud storage, and AWS S3. The library takes care of storing model artifacts in a structured way in each of them.
* All that serializing code that everyone is re-writing, starting with: scikit-learn, xgboost, PyTorch, Keras, and catboost (<a href="https://twitter.com/simonvc/status/1301941253467181057">because of Simon</a>) 😸<
* Collection of meta-data about the Python runtime, dependencies, and git status of the code that was run. Right now, it gets returned to you at the end of the upload.

## Do you want to take it for a spin?

In the coming weeks, I’m aiming to release the earliest version of this. It’s probably a bit rough around the edges, and we all know that Python _on your computer_ is not the same as Python _on my computer_. I’ve written a ton of tests, but —

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Github needs a &quot;works on my laptop&quot; repo sticker <a href="https://t.co/lAFceKgR1q">https://t.co/lAFceKgR1q</a></p>&mdash; Neal Lathia (@neal_lathia) <a href="https://twitter.com/neal_lathia/status/1298571067401875456?ref_src=twsrc%5Etfw">August 26, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

If you want to give this a spin, drop me an email 🙏

## Want to discuss more?

The one _bigger_ take-away from this work I’ve been doing is that there are _so many of us_ who are working through similar problems when building ML systems. If you want to chat about this and share your pains / ask me any questions — feel free to reach out!
