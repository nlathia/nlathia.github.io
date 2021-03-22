---
layout: post
title: "A Machine Learning Business Canvas"
description: A four step approach to approaching ML problems
categories: [machine-learning]
---

These days, there are two kinds of companies who are interested in machine learning or "artificial intelligence:"

1. **_Companies that exist because of machine learning_**
<br />They are building self-driving cars, building APIs that serve predictions from their text/vision models, or building tooling and platforms for ML.
2. **_Companies that want to improve their products by using machine learning_** 
<br />These places have one or more core products already, and could try to trudge along without machine learning--but are interested in seeing how their business could change if they adopted this new technology.

Although the companies in the former group tend to get a lot of our attention, the majority of companies who are thinking about what they could do with ML fall into the second category. For them, ML could be transformative, if applied successfully (do you remember that Netflix started out as a DVD rental business, way before becoming an "[everything is a recommendation](https://netflixtechblog.com/netflix-recommendations-beyond-the-5-stars-part-1-55838468f429)" company?). And therefore, these companies need to figure out a way to identify where ML could help.

An approach that I've encountered time and again is folks proposing to use ML in a particular area _because it's possible_. I call this 'doing ML for ML's sake:' it starts with thinking about the things that ML usually does (classification, regression, ranking, etc.) and then finding problems that look like they fit with the tools in ML's toolbox. This approach is fairly widespread--even research papers do this. Unfortunately, it's also one of the reasons why I've seen Data Scientists get frustrated when their ideas are not taken up in their companies.

In the last month, I ran several ML bootcamps with a total of \~50 Data Scientists at Monzo. Since there are several great machine learning courses that are readily available online (such as [fast.ai](https://course.fast.ai/) & [full stack deep learning](https://fullstackdeeplearning.com/spring2021/)), I decided to spend the morning session of the bootcamp talking through the questions we should answer about a project _in order to decide whether_ we should start working on it with machine learning.

Based on these sessions, I've put together a [Machine Learning Business Canvas](https://docs.google.com/document/d/1u9LuX12vUrRE6tM_nk44vRweAhk81EM98AAxwDhU5C8/copy) Google doc; the rest of this blog post runs through the questions it has, and why they're important.

# 💡 Value & Business Impact

This first set of questions are laying foundations:
1. What business problem are we trying to solve, and how would solving it benefit our customers?
2. How do we measure the size of this problem today, and how big is it?
3. What impact could using machine learning in this problem have?

The goal of answering these questions is to anchor the proposal with the goals and objectives of the company, and make sure that the problem is 'big enough' to warrant working on it.

Let's imagine that we did not have answers to these questions: we could run the risk of training a model that does not solve a business problem, that solves one that is tiny, or tries to solve one where even _the best_ machine learning model would have marginal impact. Yikes!

# 🏭 Existing Systems & Processes

Okay, so we've validated that there's an important business problem to solve. Onto the next questions:
1. How are we tackling this problem today?
2. What systems already exist for this, and where would the machine learning model integrate with them?
3. Who are the relevant teams who own this area? Have they been consulted?

Let's imagine that the proposal is for an area that is not being tackled at all today, has no systems, and no team who owns the problem. This should ring alarm bells--perhaps it means that the business problem that was identified in the previous section isn't currently a priority.

Many folks have come across Zinkevich's "don't be afraid to launch a product without machine learning" [rule](https://developers.google.com/machine-learning/guides/rules-of-ml#before_machine_learning): if a company isn't using machine learning to tackle a business problem, it usually means that the _first_ thing they should try is not machine learning.

I added in the last question as a prompt to get folks to talk to each other, in order to think about the _timing_ around working on a machine learning idea. A simple example of poor timing could be that the team that owns a given system may be about to embark on overhauling it completely. Even a great ML idea is less likely to see the light of day if that is happening!

# 🤖 Machine Learning Problem Formulation

We're halfway through the canvas, and only _now_ we're starting to think about the actual machine learning:

1. What kind of machine learning problem is this?
2. What data will we use to train the model, and is this data already available?
3. Does using this data present any privacy or ethical concerns?
4. What offline metrics should we use to evaluate this model? How does the current system perform against them?

The crux of these questions is that the way a machine learning problem is formulated is often going to as impactful as the model itself. There aren't that many different types of problems that machine learning solves: classification, regression, ranking, recommendation, clustering, and anomaly detection will cover 99.99% of use cases. I use these six groups even though they could be interchangeable (e.g., a ranking problem could be cast as a classification problem); they do help to guide us towards the metrics we want to use to evaluate success (i.e., ranking metrics are different than classification metrics).

The second area that these questions focus on is _data_: whether it is available and usable, from both a practical and moral stand point. If the answer here is _yes_ then we can often start with a small exercise to gauge how well the current system (identified in the previous section) is doing against the offline metrics we propose on using to measure the quality of our future models. This gives us the first thing we need to get going: a baseline!

# 🚢 Model Roll-out and Monitoring

The final section forces us to come back to how the proposed model's impact will be assessed:

1. How will we test whether this model works? Who should be involved in that decision?
2. What primary & secondary metrics should we use to assess that this model is having an impact?
3. What ethical & safety concerns should we factor into this system?
4. How will we monitor that this model is continuing to work, or detect when it does not?

Common practice here includes running an A/B test--which needs to be designed mindfully, and using metrics that capture the intended business value that we set out to deliver. Some thought also needs to go into how products behave "around the ML;" i.e., what are the model's failure scenarios, and how does the product behave around them? However, these questions also act as prompts to get people talking: once an A/B test is done, knowing who should be involved in making the decision to roll the model out, and how the model will _be maintained_ post roll-out are critical to know ahead of time.

# ✅ Use this template!

During the internal ML bootcamps I ran recently, I used one of the systems we built last year: I stepped through the canvas and discussed what we did at each step. And the key take away from each part was that _answering those questions_ helped us to avoid pitfalls early and feel confident that we were building something that would be useful, impactful, and safe.

I'm now opening up this canvas for anyone else to use. The link below will prompt you to create your own copy:

➡️ [Machine Learning Business Canvas](https://docs.google.com/document/d/1u9LuX12vUrRE6tM_nk44vRweAhk81EM98AAxwDhU5C8/copy) 
