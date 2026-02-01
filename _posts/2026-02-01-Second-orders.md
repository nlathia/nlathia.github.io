---
layout: post
title: "Second order effects"
description: Predicting the impact of the future
categories: [ai]
---

It's very difficult to predict how AI is going to evolve in the future; it's even more difficult to get a grasp of what the second order effects of its evolution might be. I've been looking at the AI-for-software, which has been absolutely racing, as one area that is shaping what is to come in others. Two observations caught my eye:

## 💭 What's the default decision?

There is so much choice in the world that exists for builders. Which cloud? Which service? Which database? Which architecture? Which programming language? All of that is predicated on builders needing to make choices while they build. But the history of computing is one of raising abstractions- at some point, the builders' decisions end and the ones made by other builders 'below' prevail.

AI coding, taken to its extreme, is a text box that takes in your needs and spits out working software on the other side. This is almost akin to ordering a taxi; you rarely care which car you get, you care about getting to your destination. In this context, nearly all of the choices that would have been made by the builder are now made by the LLM. 

I assume that builders are still making some of their own high-level decisions, so we're quite far from that in the grand scheme of things. But we might no longer be far off for lower-level decisions. What's the default way an LLM will sort an array?

## 🤖 What happens when you are an AI's decision?

Relatedly, I'm sure that many builders would love if _their_ project or product became a default output for an LLM in a given context. If someone were to ask an LLM "what's the best AI agent for operations in financial services?" I would be thrilled for those systems to mention [Gradient Labs](https://gradient-labs.ai/).

The most notable example of how this changes dynamics, from a month ago, is [this comment on Github](https://github.com/tailwindlabs/tailwindcss.com/pull/2388#issuecomment-3717222957) from Tailwind CSS' founder. The key highlight being:

> Traffic to our docs is down about 40% from early 2023 despite Tailwind being more popular than ever. The docs are the only way people find out about our commercial products, and without customers we can't afford to maintain the framework.

The unfortunate second order effect is that it sounds like their channel for "conversion" took a nosedive as their product grew. Previously, growth (including becoming an LLM's default decision) might have always felt like a good thing. But with this example, perhaps it means we'll have to rethink how we structure services and (particularly, open) projects. 

What are the equivalents of these, in other industries? 🤔