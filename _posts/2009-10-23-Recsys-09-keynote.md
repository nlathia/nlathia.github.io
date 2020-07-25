---
layout: post
title: "ACM RecSys 2009 Keynote (in 140 character chunks)"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

The third <a href="http://recsys.acm.org/">ACM RecSys</a> conference started today in New York; unfortunately I could not make it. However, a number of people who I follow on Twitter are there (<a href="http://twitter.com/xamat">@xamat</a>, <a href="http://twitter.com/danielequercia">@danielequercia</a>, <a href="http://twitter.com/barrysmyth">@barrysmyth</a>)... and are tweeting away as the conference unfolds. You can follow the stream of #recsys09 tweets <a href="http://search.twitter.com/search?q=%23recsys09+OR+%23recsys">here</a>. Although I'm sure that there are many details that do not make it into the 140 character-long tweets, they provide a real time snapshot of what is going on in the conference.

For example, the <a href="http://recsys.acm.org/program.html#keynote">first keynote</a> has <a href="http://twitter.com/barrysmyth/statuses/5097222885">just ended</a>. <a href="http://corp.strands.com/team">Francisco Martin</a>, Founder/CEO Strands, gave a talk about the "Top 10 Lessons Learned Developing, Deploying, and Operating Real-World Recommender Systems." Here's the twitter summary (note: copy/pasted and lightly edited to merge similar tweets).

**Lesson 1** - Make sure a recommender is really needed! Do you have lots of recommendable items? Many diverse customers?... also think Return-on-Invesment... a more _sophisticated_ recommender _may_ not deliver a better ROI.

**Lesson 2** - Make sure the recommendations make _strategic_ sense. Is the best recommendation for the customer also the best for the business? What is the difference between a good and useful recommendation? Good recommendations vs useful recs; Obvious recommendations may not be useful; risky recs may deliver better long-term value.

**Lesson 3** - Choose the right partner! Select the right rec vendor vs hire some #recsys09 students. If you are a big company the best you can do is to organize a contest.

**Lesson 4** - Forget about cold-start problems (!) .... just be creative. The internet has the data you need (somewhere...)

**Lesson 5** - Get the right balance between data and algorithms. 70% of the success of a #recsys is on the data, the other 30% on the algorithm.

**Lesson 6** - Finding correlated items is easy but deciding what, how, and when to present to the user is hard... or dont just recommend for the sake of it. Remember user attention is a scarce and valuable resource. Use it wisely! ... dont make a recommendations to a customer who is just about to pay for items at the checkout! User interface should get at least 50% of your attention.

**Lesson 7** - Dont's waste time computing nearest neighbours (use social connections)... just mine the social graph. Might miss useful connections??

**Lesson 8** - Dont wait to scale

**Lesson 9** - Choose the right feedback mechanism. Stars vs thumbs .... the <a href="http://www.techcrunch.com/2009/09/22/youtube-comes-to-a-5-star-realization-its-ratings-are-useless/">YouTube problem</a>. More research on implicit and other feedback mechanisms is needed. The perfect rating system is no rating system! ... focus on the interface. Seems to me this is one of the gaps in current research... algorithms &gt; data &gt; interface

**Lesson 10** - Measure Everything! ... business control and analytics is a big opportunity here.

**Keynote Takeaway** - Think about application context; Focus on interface as much as algs; Be creative with startup data. ... the UI needs to get the lion's share of the effort (50%) compared to algorithms (5%), knowledge (20%), analytics (25%)

