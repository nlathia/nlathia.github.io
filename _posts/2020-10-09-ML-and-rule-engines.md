---
layout: post
title: "Combining rule engines and machine learning"
description: One does not need to replace the other.
categories: [tech-lead, machine-learning]
---

In the infamous [Rules of Machine Learning](https://developers.google.com/machine-learning/guides/rules-of-ml), one of the first sections states "don’t be afraid to launch a product without machine learning" -- and suggests launching a product that _uses rules_. One of the examples it gives is ranking apps in an app store using a heuristic that captures the app's popularity: install rate.

This is really solid advice. In fact, many companies will have built a rule engine or two before having anyone who was hired to think about machine learning. However, one of the thoughts that I've heard many times from machine learning folks is that "machine learning systems should _replace_ rule engines" -- and that it is just a matter of time, effort, and iteration until they do. 

In my experience, this type of thinking leads folks towards solving the wrong types of problems. It shifts the focus to replicating what can already be accomplished with rules, and removes focus from using machine learning to do what it can do best to _improve_ the outcomes of the entire system.

Based on having had this discussion plenty of times, I recently wrote up an internal doc as a guide when there is appetite to add machine learning into an existing rule engine. This blog post pulls out three key questions from it:

* Can we use machine learning in a rule engine?
* How and where do we add the "*machine learning bit*?"
* How do we architect this type of system?

## Background: rule engines

There are two traditional ways that Engineering teams build rules engines. The first is to use knowledge or requirements from the domain they work in to map out the "_when X happens, the system should do Y_" cases.

At Monzo, we recently built a system that routes different customer chats to specialised agents. One of the rules it uses here is to look at which help article a customer came from: if you were reading about how to get a bank statement and then tapped "chat to us," it's likely that you need a bank statement, so the conversation is made available to agents who have that expertise.

The second way to write rules is to look for "easy" relationships in data. It's often fairly straightforward to find insights that are of the "X% of the time" or "Y% of customers" form, and to then write rules that monitor for these situations occuring. 

The system I mentioned above, which routes conversations to specialised agents, was extended with this type of rule. We spotted, in the data, that sometimes customers were waiting a long time for a specialised agent, because those agents were busy. So we added a rule to the system that checks whether the customer has _nearly_ been waiting longer than we would like them to for a specialised agent, and, if so, we make their conversation available to other types of agents too.

Given a set of rules, there are two generic ways that I've seen systems apply them — knowing how this works will also help to decide what type of machine learning could be helpful.

1. Apply rules **one-by-one** in order and stop when one matches
2. Apply all the rules and then make a **"final" decision**

## Would machine learning help at all?

Rule engines, expressed a family of `if`-statements, do really well in deterministic scenarios. If you can write a rule set that captures everything you need, then you don't need machine learning! Job done ✅

The situations where machine learning can usually help share a common theme: they are trying to _optimise_ some kind of process which cannot be fully enumerated with a deterministic set of rules.

This switch from "control" to "optimise" is usually a hallmark indication that learning from data can bring some benefits. Sometimes, this manifests as aspects of  systems that, from a rule-writing perspective, sound vague (for example: "suspect payment" or "conversation that is about a certain topic" or "a photograph that has an animal"); many of these things usually have to do with *human behaviour*.

## Where does machine learning fit in?

### 1. Use machine learning to design (new) rules

There are cases where we don't know *what rules to write*. For example: what rules would increase conversion of a hotel booking site? What rule would catch a specific type of fraud? What inputs should rules that help customers self-service be?

This is where machine learning can help. You can train machine learning models to predict an outcome, given a ton of different inputs (or features). Many models, such as the tree-based ones that we tend to reach for first, will then tell you which inputs were most predictive of the output, and by how much.

For example, I recall a project where a Data Scientist trained a random forest based on a ton of session event aggregations to predict hotel conversion. One of the most predictive features was customers clicking on images. This is a far cry from any type of rule that we could dream up by standing in front of a white board; however, it's quite actionable! Promoting hotels with images in search results lead to improved conversion.

In these cases, you don't need to ship a model--you ship the *insight* that you got from that model, by writing rules. I know that this may not sound extremely exciting (after all, no machine learning gets "shipped")--but it is fast and impactful.

### 2. Use machine learning and rules together

The second way that ML can fit into the picture is by doing some "live" inference, as part of the overall system. In many cases, the machine learning component is solving one specific sub-problem of the entire system. It should not be trying to re-implement functionality that is already captured in the rules, especially for rule engines that have a *very wide scope*.

### Apply the rules first, and then use machine learning

There are cases where we can treat machine learning models as a special type of rule.

The chat message-routing rule engine that I touched on above had one problem: when customers would come into the chat screen from "generic" parts of the app, we could not apply rules to route them to specialised agents. In this case, we recycled a topic classifier system that we had previously built, and tacked it onto the end of the rule engine. If none of the rules matched, the system tries to infer the topic of the conversation using a family of BERT models; if one of those gives us a "yes," we route the chat to specialised agents.

➡️ This setup can sometimmes mean that the machine learning model will only run into the "harder" case. This is an important consideration to keep in mind while training your model.

### Use machine learning to make a decision based on the output of many rules

An alternative approach is to use machine learning to make a final decision, where rules are used to generate input features. 

For example, a few years ago we ran an experiment with recommending help articles in the Monzo app. There is a rule engine that is looking at a ton of different characteristics of customer accounts when deciding which content to surface. Our experiment took the outcomes of the rules as input features to a model, which would make the final ranking decision. This specific experiment didn't work out, but it's an architecture that has remained across or code base.

## Conclusions

When iterating on a system, it's common to start out with a rule engine. From what I've seen, it's less common for those systems to progress towards starting to use _some_ machine learning, and it's fantastically rare for those systems to be migrated to _only_ use machine learning (if you've managed to do that, I want to hear from you!). 

Instead, a pragmatic trade-off is to spend time understanding what value the machine learning bit is providing, and to focus your efforts on that. In this post, I've covered a few different shapes that these systems can take, and skipped some of the other hard bits--such as evaluating them holistically. I'll leave that for another time. 

