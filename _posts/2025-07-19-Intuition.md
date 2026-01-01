---
layout: post
title: "Intuition in AI"
description: Evals aren't the extent of it
categories: [ai]
---

Reading posts about the scientific method applied to developing AI agents - I've got to stand on my soap box for a second & share what I've been telling folks for years:

The only way to develop a deep intuition about an AI system is to *read the data.* The literal inputs and outputs. Technical folks are often pushed away from doing this because they think it's lacking in rigour or think it's cheating compared to solely focusing on test set metrics & evals. But if your evals have a 99% pass rate: what happened in those failures? Are they okay, or headline-grabbing catastrophes? What things are you not measuring in the ones that passed? Were they "correct" outcomes, delivered poorly? If you aren't reading, you'll never know whether something that has green metrics is actually good.

At Gradient Labs this means that folks are told to read hundreds of conversations. They build up an immense empathy for the types of problems our partners' customers need support for. They do the "scientific" bit with evals on their changes and still roll things out in an incremental, feature-flagged way. But then they keep reading. 

In our earliest days, we read every single conversation that customers had with our AI agent - we've scaled beyond that but still drive this message and spend more time discussing individual cases than suites of metrics. 
