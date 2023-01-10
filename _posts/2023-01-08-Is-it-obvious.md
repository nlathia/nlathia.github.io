---
layout: post
title: "AI adoption: is it obvious yet?"
description: Categorising AI in today's companies
categories: [machine-learning]
---

Regardless what you think about [chatGPT](https://chat.openai.com/chat), its release last year heralded yet another hype wave for artificial intelligence. This release probably did more to market the value of machine learning to non-experts than anything I've ever seen come before it--it [seized people's imagination](https://www.nytimes.com/2023/01/07/technology/generative-ai-chatgpt-investments.html).

I couldn't escape having conversations about it. People _suddently_ wanted to talk about chatGPT (and other models like like GPT-3 and stable diffusion) without having ever heard words like language model, self-supervision, or attention! Even outside of work, suddenly the potential of an [intelligence explosion](https://en.wikipedia.org/wiki/Technological_singularity#Intelligence_explosion) would come up in chats at birthday parties.

Returning to a more pragmatic reality: one topic of conversations that I'm sure is happening in many companies around the world is something along the lines of:

> "hey, how can we start using (more) artificial intelligence in our products?"

I've had flavours of this conversation countless times in the last several years and have changed my perspective of it as AI has progressed. This blog post is a rundown of some of the classic arguments I've seen in this space: 

## ❌ Technical maturity ("let's build our capability first...")

A lot of infrastructure vendors frame ML adoption in terms of technical maturity. Microsoft has an [MLOps maturity model](https://learn.microsoft.com/en-us/azure/architecture/example-scenario/mlops/mlops-maturity-model), Google describes [three levels](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning) of maturity, and Amazon has several different sites about MLOps. Unsurprisingly, each step of maturity often maps to one or more platform components to buy. 😇

The problem with this view is that ML adoption is broadly framed as a technical problem, not a cultural or product development one. Level 0 for Google<sup>[1](#footnote1)</sup> and Microsoft, is having a team that does its ML manually--which takes for granted that you have a team doing ML at all and getting something worthwhile out of it. It assumes that there's someone with sufficient leverage and access to the right meetings to put ML onto the agenda, and assumes that everyone else in that room agrees.

Companies _could_ climb all of the levels of these frameworks and still not see much impact in their ML work. Moreover, with many AI models now being commoditised behind APIs it seems unnecessary to climb this ladder of technical excellence before using ML at all.

So I think that right now, the technical maturity piece is a distraction with respect to AI adoption. Technical maturity follows AI adoption, it doesn't precede it.

## ❌ Product maturity ("one day this will be smart, but for now...")

People in the data and machine learning communities--myself included--are often _strong_ advocates for **not** using AI. This kind of thinking is even baked into Google's [Rules of Machine Learning](https://developers.google.com/machine-learning/guides/rules-of-ml#before_machine_learning) which I have sent to countless people: "_don’t be afraid to launch a product without machine learning_."

I still believe in the _spirit_ of this statement: start small and iterate. If a small set of if-statements does the job, leave it there and move on. But there are two major problems with this view.

First, it can easily frame ML as a future horizon that never never be reached. This is because: 

* Teams can indefinitely stretch out what they can do _without ML_--there's no deterministic way to say "ok, we've got enough if-statements, now it's ML's turn"
* ML is often [incorrectly](https://nlathia.github.io/2020/10/ML-and-rule-engines.html) framed as an alternative to rules, rather than something that lives alongside them<sup>[2](#footnote2)</sup> 
* And, perhaps most cynically, it's hard to get people to understand things that their salary depends on them [not understanding](https://twitter.com/kareem_carr/status/1611785671877828623).

Second, state-of-the-art ML now enables us to build things that are _technically impossible to build_ without machine learning. So taking an approach where ML "comes later" discards all of the opportunity that ML affords people to _shape_ their product based on an increasing set of capabilities. The analogy I like to use here is that we wouldn't build self-driving cars, search engines, or chat bots by seeing how far we can get with if-statements _first_: why should we, elsewhere?

So, yes, let's keep starting small and iterating. But product development does not need to precede AI adoption anymore. 

# ✅  Is it obvious?

My current heuristic for measuring AI adoption is to ask questions directed at finding out **how obvious it is** to use it, as a tool, in a team's context. One of the ways that I like to think this is by analogy with other technologies: take any statements that are being made today about "AI" and swap out "mobile app" or "web site."

For example, "a company should have web site" should be a fairly uncontroversial statement to 99.9% of us in 2023. But then, think back to how _non-obvious_ that was to companies when the web first emerged. I imagine there were similar "what is this web thing, and how can we use more of it?" discussions at the time. Maybe folks in the room [weren't convinced](https://www.newsweek.com/clifford-stoll-why-web-wont-be-nirvana-185306) that the web was going to be a big deal.

The same has been true for using the cloud, mobile apps, for (big) data, and more--nearly for any technology that gets its moment to shine with a `-first` suffix: cloud-first, mobile-first, and now... AI-first<sup>[3](#footnote3)</sup>.

A technology that has been fully adopted by an organisation becomes _obvious_ to them because nobody needs to convince others to use it--it's just part of the default way that problems are solved. 

And that's where we are with AI adoption today--companies that find it obvious, and companies that do not. The answer to this question splits the world in two:

### 🤔 No, it's not obvious

Unfortunately, I think that majority of places in the world today still reside in the 'not obvious' camp.

These types of places may view AI as extremely promising ("we should do this!") but could ultimately continue existing - with less scale, profit, or capability - without AI. People in established organisations don't _naturally_ think of AI when framing how they will solve problems; they therefore don't build [data engines](https://twitter.com/karpathy/status/1599852921541128194) or feedback loops.

The ML lifecycle is sometimes longer than product planning cycles. If you do quarterly planning, that may effectively translate into expecting an ML miracle to happen in less than 90 days.

Working in AI in this environment is part evangelist (convincing people to use the AI at all), part teacher (getting people to think about what can be done with AI when framing or solving problems), and part engineer.

### 🚀 Obviously!

There are a few classes of companies that default to using AI today:

1. Companies that exist because of AI. They are building products because of what we _can_ do with AI. Many of them are new and have leapfrogged the AI adoption problem altogether.
2. Industry AI research labs. As large tech companies go all-in on AI, they increasingly have departments or sub-companies that are purely dedicated to AI. Some of that work goes on to be integrated into the parent company, some of these AI systems end up as commercial APIs.
3. Companies that have successfully transformed themselves. There are some notable companies that were not founded on the premise of AI, but are now regular appearances in the conference circuit talking about their AI in depth.

The final class of companies where AI is a no-brainer, but who technically do not work on AI itself, are those that are building MLOps tools and platforms for _others_ to run AI compute workloads or have the right system abstractions in place. Building these systems may require very little hands-on AI, but does require intimate knowledge of the problem space itself.

## Conclusion

https://wrongbutuseful.substack.com/p/elbows-of-data

Adoption doesn't mean blind adoption / doesn't mean don't think about this deeply


## 🔢 Footnotes

<a name="footnote1">1</a>: Google also has a PDF with an [AI Maturity Scale](https://services.google.com/fh/files/misc/ai_adoption_framework_whitepaper.pdf) which goes a bit beyond the technical--it has progression levels from "tactical" through to "strategic" and "transformational."

<a name="footnote2">2</a>: ML doesn't always replace rules, sometimes they work together - check out [@jeremyjordan](https://twitter.com/jeremyjordan)'s [NormConf talk](https://www.youtube.com/watch?v=gXe9iXNTuDc).

<a name="footnote3">3</a>: "Companies are either born AI-first or live long enough / grow big enough to ultimately become AI-first." - [@nathanbenaich](https://twitter.com/nathanbenaich/status/1607760752315863042)
