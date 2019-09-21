---
layout: post
title:  "Is BERT too big for production?"
tags: [opinion]
excerpt_separator: <!--more-->
---


Summary
<!--more-->

Background
• Tweets about BERT being too big for production
• Recent research on making bigger & smaller models
• Not many posts on how this stuff is actually shipped

What is production?
• Where you make automated decisions on "live" customer data
• Three modes for putting language models into production
• Cron jobs. Example: generate embeddings from documents in our knowledge base on a regular cycle.
• Event-based. Example: generate/update embeddings of a chat, while it happens. Need to keep track of turns.
• Live. Example: generate/retrieve embedding for a set of chat messages and then return the most similar content.

In all of these, the prediction time for BERT is small/doesn't matter, compared to the full

Speed
• Horizontal vs. vertical scaling

Huggingface in production
• Loading BERT before the service starts receiving requests
• Async loop for predictions
• Minor details: PyTorch threads, Sanic threads

Other thoughts
• Breaking up a neural net into multiple services (too much complexity for now)
• Distilling models is still very valuable research

