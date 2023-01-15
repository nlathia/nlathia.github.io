---
layout: post
title: "AI adoption: is it obvious yet?"
description: Categorising AI in today's companies
categories: [machine-learning]
---

Regardless what you think about [chatGPT](https://chat.openai.com/chat), its release last year heralded yet another hype wave for artificial intelligence. This release probably did more to market the value of machine learning to non-experts than anything I've ever seen come before it--chatGPT [seized people's imagination](https://www.nytimes.com/2023/01/07/technology/generative-ai-chatgpt-investments.html).

I couldn't escape having conversations about it. People _suddenly_ wanted to talk about chatGPT (and other models like like GPT-3 and stable diffusion) without having ever heard words like language model, self-supervision, or attention layers. Even outside of work, the potential of an intelligence [explosion](https://en.wikipedia.org/wiki/Technological_singularity#Intelligence_explosion) would come up in chats at birthday parties.

Returning to a more pragmatic reality: one topic of conversations that I'm sure is happening in many companies around the world is something along the lines of:

> "hey, how can we start using (more) artificial intelligence in our products?"

I've had flavours of this conversation countless times in the last several years and have changed my perspective of it as AI has progressed. This blog post is a rundown of some of the classic arguments I've seen in this space: 

## ❌ Technical maturity ("let's build our capability first...")

A lot of infrastructure vendors frame ML adoption in terms of technical maturity. Microsoft has an [MLOps maturity model](https://learn.microsoft.com/en-us/azure/architecture/example-scenario/mlops/mlops-maturity-model), Google describes [three levels](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning) of maturity, and Amazon has several different sites about MLOps. Sometimes, each step of maturity maps to one or more platform components to buy. 😇

The problem with this view is that ML adoption is broadly framed as a technical problem, not a cultural or product development one. Level 0 for Google<sup>[1](#footnote1)</sup> and Microsoft, is having a team that does its ML manually--which takes for granted that you have a team doing ML at all and getting something worthwhile out of it. It assumes that there's someone with sufficient leverage and access to the right meetings to put ML onto the agenda, and assumes that everyone else in that room agrees.

Companies _could_ climb all of the levels of these frameworks and still not see much impact in their ML work, and get stuck in a state of technical proficiency but low AI impact. Moreover, with many AI models now being commoditised behind APIs it seems unnecessary to climb this ladder of technical excellence before using ML at all.

So I think that right now, the technical maturity piece is a distraction with respect to AI adoption. Technical maturity _follows_ AI adoption, it doesn't precede it.

## ❌ Product maturity ("one day this will be smart, but for now...")

People in the data and machine learning communities--myself included--are often _strong_ advocates for **not** using AI. This kind of thinking is even baked into Google's [Rules of Machine Learning](https://developers.google.com/machine-learning/guides/rules-of-ml#before_machine_learning) which I have referenced several times before: "_don’t be afraid to launch a product without machine learning_."

I still believe in the _spirit_ of this statement: start small and iterate. If a small set of if-statements does the job, leave it there and move on. But there are two major problems with this view.

First, it can easily frame ML as a _future_ horizon that will never be reached. This is because: 

* Teams can indefinitely stretch out what they can do _without ML_--there's no deterministic way to say "ok, we've got enough if-statements, now it's ML's turn"
* ML is often [incorrectly](https://nlathia.github.io/2020/10/ML-and-rule-engines.html) framed as an alternative to rule-based code, rather than something that lives alongside it to get the best of both<sup>[2](#footnote2)</sup> 
* And, perhaps most cynically, it's hard to get people to understand things that their salary depends on them [not understanding](https://twitter.com/kareem_carr/status/1611785671877828623).

Second, state-of-the-art ML now enables us to build things that are _technically impossible to build_ without machine learning. So taking an approach where ML "comes later" discards all of the opportunity that ML affords people to _shape_ their product based on an increasing set of capabilities. The analogy I like to use here is that we wouldn't build self-driving cars, search engines, or chat bots by seeing how far we can get with without machine learning _first_--so, why should we, elsewhere? 

By all means, let's keep starting small and iterating. But product development should _follow_ AI adoption, rather than precede it.

# ✅  Make it obvious

My current heuristic for measuring AI adoption is to ask questions directed at finding out **how obvious** it is to use, as a tool, in a team's context. One of the ways that I like to think of this is by analogy with other technologies: take any statements that are being made today about "AI" and swap that acronym out with "database," "mobile app" or "web site."

For example, "a company should have web site" should be a fairly uncontroversial statement to 99.9% of us in 2023. But then, think back to how _non-obvious_ that was to companies when the web first emerged. I imagine there were similar "what is this web thing, and how can we use more of it?" discussions at the time. Maybe folks in the room [weren't convinced](https://www.newsweek.com/clifford-stoll-why-web-wont-be-nirvana-185306) that the web was going to be a big deal.

The same has been true for using the cloud, mobile apps, for (big) data, and more--nearly for any technology that gets its moment to shine with a `-first` suffix: cloud-first, mobile-first, and now... AI-first<sup>[3](#footnote3)</sup>. The biggest difference with the latter is that AI has now been around for a very long time and is far from an emerging technology, its development has not started recently, just skyrocketted.

The reason why I'm framing this as assessing how obvious it is: a technology that has been fully adopted by an organisation becomes _obvious_ to them because nobody needs to convince others to use it--it's just part of the _default_ way that problems are solved. In a tech org, it's obvious that solving problems will involve writing code (it's almost a no-brainer!).

And that's where we are with AI adoption today--companies (or teams within companies) that find it obvious, and companies that do not. This splits the world into two:

### 🤔 No, it's not obvious

Unfortunately, I think that majority of places in the world today still reside in the 'not obvious' camp.

These types of places tend to be fairly established already. Even if they view AI as being extremely promising ("we should do this!"), they could continue existing--with less scale, profit, or capability--without AI.

People in established organisations don't _naturally_ think of AI when framing how they will solve problems or build products; they therefore don't build [data engines](https://twitter.com/karpathy/status/1599852921541128194) which is how competitive advantage is nurtured in the AI space.

Working in AI in this environment is part evangelist (convincing people to use the AI at all), part teacher (getting people to think about what can be done with AI when framing or solving problems), and part engineer (getting things done). Right now, I haven't seen too many places that are as explicit as companies were back in the "[digital transformation](https://en.wikipedia.org/wiki/Digital_transformation)" era (imagine having a Chief AI Transformation Officer!), but instead I've seen the responsibility for AI adoption being pushed onto their ML teams themselves--expecting them to [elbow their way in](https://wrongbutuseful.substack.com/p/elbows-of-data).


### 🚀 Obviously!

There are a few classes of companies that default to using AI today:

1. Companies that exist because of AI. They are building products because of what we _can_ do with AI. Many of them are new and have leapfrogged the AI adoption problem altogether.
2. Industry AI research labs. As tech companies go all-in on AI, they increasingly have departments or sub-companies that are purely dedicated to AI (research). Some of that work goes on to be integrated into the rest of the company and some of these AI systems end up as commercial APIs. But they also do not need to convince others to adopt AI.
3. Companies that have successfully transformed themselves. I reckon this is the minority class here. There are some notable companies that were not founded on the premise of AI, but now use AI throughout their entire portfolio of product features.

The final class of companies where AI is a no-brainer are those that are building MLOps tools and platforms for _others_ to train, ship, or monitor their AI. Building these systems may require very little hands-on AI, but does require intimate knowledge of the problem space itself.

## Conclusion

_Adopting_ AI inside of a company does not mean doing so without being mindful about it. It doesn't mean that people should no longer think deeply about how AI works, whether it is amplifying bias, or leading to worse outcomes. 

This post is just about whether AI is in the _default_ toolbox<sup>[4](#footnote4)</sup> that a team or company has when thinking about how to solve a problem, sitting there alongside all of the other obvious things that we use to build systems. If it's in there, great! But for many, a long AI transformation still awaits.


## 🔢 Footnotes

<a name="footnote1">1</a>: Google also has a PDF with an [AI Maturity Scale](https://services.google.com/fh/files/misc/ai_adoption_framework_whitepaper.pdf) which goes a bit beyond the technical--it has progression levels from "tactical" through to "strategic" and "transformational."

<a name="footnote2">2</a>: ML doesn't always replace rules, sometimes they work together - check out [@jeremyjordan](https://twitter.com/jeremyjordan)'s [NormConf talk](https://www.youtube.com/watch?v=gXe9iXNTuDc).

<a name="footnote3">3</a>: "Companies are either born AI-first or live long enough / grow big enough to ultimately become AI-first." - [@nathanbenaich](https://twitter.com/nathanbenaich/status/1607760752315863042)

<a name="footnote4">4</a> "... this is a good grounding way to think about ML today - it’s a step change in what we can do with computers, and that will be part of many different products for many different companies. Eventually, pretty much everything will have ML somewhere inside and no-one will care." - Ways to think about machine learning by [Ben Evans](https://www.ben-evans.com/benedictevans/2018/06/22/ways-to-think-about-machine-learning-8nefy)
