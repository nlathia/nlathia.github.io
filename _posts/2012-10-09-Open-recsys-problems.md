---
layout: post
title: "Open Problems in Recommender Systems"
description: Originally published on urbanmining.wordpress.com
categories: [research]
---

<a href="http://datasciencelondon.org/">Data Science London</a> hosted a <a href="http://www.meetup.com/Data-Science-London/events/83256112/">meetup on recommender systems</a> at the end of the <a href="http://strataconf.com/strataeu">Strata London Conference</a>. To kick-off the presentations, I was asked to give an overview of what is happening in the #recsys research community, with a particular focus on what happened recently in Dublin at <a href="http://recsys.acm.org/2012/">ACM RecSys 2012</a> (which was then followed by talks by <a href="http://www0.cs.ucl.ac.uk/staff/t.jambor/">Tamas Jambor</a>, <a href="www.xyggy.com">Dinesh Vadhia</a>, and <a href="http://myrrix.com/">Sean Owen</a>). It was certainly a daunting task to give a 15-minute summary of a week-long conference, so I chose to do so by giving as many pointers to people and research topics as possible, within some kind of coherent story line.

This is what I went for (slides below):

## Why do we need recommender systems?

While the older papers in the field talks about <a href="http://en.wikipedia.org/wiki/Information_overload">information overload</a>, a recent alternative idea is that the web, which has facilitated the quick and large-scale publication and distribution of all kinds of goods, has removed the financial, editorial, or other kinds of filters that we previously used (<a href="http://www.youtube.com/watch?v=LabqeJEOQyI">filter failure</a>). But, really, this is old news too: we now implement recommender systems to foster engagement and community, and the web has become an ecosystem of personalisation (see Daniel Tunkelang's <a href="http://thenoisychannel.com/2012/09/16/linkedin-presentations-at-recsys-2012/">talk</a> about LinkedIn recommendations).

## What are recommender systems?

They are collaborative, query-less discovery engines. They are machine learning applied to preference signals. And while the Netflix prize always comes to mind in this context, there is actually a thriving and growing research community that meets annually at the ACM RecSys conference (and I managed to find a photo of me at RecSys 2007!)

## Don't Reinvent the Wheel

Many times that I talk to start-ups that are building recommender systems, they tell me about problems that they are having which have been regularly visited by the rich research literature (cold-start, scalability, etc). So, what are some of the problems that the research community is looking at today? I made up 5 points, based on looking at the sessions and <a href="http://recsys.acm.org/2012/program.html">program</a> from this year's conference:

### Problem 1: Predictions

The research community has become very aware of the fact that there is more to recommendation than predicting ratings. There was an entire workshop dedicated to <a href="http://ir.ii.uam.es/rue2012/">evaluation beyond accuracy</a> (proceedings are now online <a href="http://ceur-ws.org/Vol-910/">here</a>). How can you make recommendations novel, diverse and serendipitous? How do you deal with conflicting objectives?

### Problem 2: Algorithms

Related to the above, there was a nice discussion on the balance between the effort required (imposed) on users to rate things in order to improve recommendations vs. improving algorithms that can deal with few ratings. This topic fits well into the general theme of defining just what algorithms need to do: as above, while the traditional focus has been on prediction, recent shifts (including the best paper at the conference) were about ranking.

### Problem 3: Users and Ratings

The traditional mode of thinking about recommender systems has been "users" and "items," who are linked by "ratings." This paradigm is slowly being shown to be incomplete. What about <a href="http://cars-workshop.org/">context</a>? What about groups of users? What about the platform you are delivering recommendations on (tablets, mobiles, PCs, televisions)? There was a related discussion at the <a href="http://loca.mobilelifecentre.org/">mobile workshop</a> I co-organised: is there a difference between capturing preference (what I like) vs. capturing intent (what I want)? As a side note, many times that I hear that the Netflix prize come up in conversation, people echo the widely publicised fact that the challenge solutions were not implemented due to their engineering constraints. But it is worth reinforcing a broader point that <a href="http://twitter.com/xamat">Xavier</a> presented: Netflix has moved on to "other issues" that are more important.

### Problem 4: Items

The idea of having tangible "things" that you recommend is also slowly shifting. There was a whole workshop dedicated to recommender systems for <a href="http://pc57724.uni-regensburg.de/lifestyleChange/">lifestyle change</a>, which I sadly missed. If "items" can now subsume decisions, behaviours, and processes - what are they, and are they worth thinking about as items?

### Problem 5: Measurement

The most recurring conversation at ACM RecSys is about understanding how to measure progress. I've already touched on it above; however, this year there were three clear groups: (a) algorithm-people, who present their results with empirical metrics performed on offline experiments, (b) usability-people, who perform experiments by means of user studies, and (c) the industry - which was clearly advocating online, large-scale A/B testing (see this great <a href="http://www.exp-platform.com/Pages/2012RecSys.aspx">keynote</a>). Sadly, academic researchers don't have access to (c). Moreover, the real problem is that nobody really knows how (a), (b), and (c) relate to one another.

## So, to end: 3 key take-aways

First, recommender systems are an ensemble... of disciplines. This is clearly recognised as not being a exclusive machine learning topic. Second, the idea of black-box recommenders is slowly fading. Long live the domain! (and check out <a href="http://www.slideshare.net/plamere/ive-got-10-million-songs-in-my-pocket-now-what">Paul's keynote on music</a>). Finally, the recsys research community clearly differentiates itself from others by having always been highly involved with the industry and start-ups who are building and running these systems, and there are tons of great open-source projects (e.g., <a href="http://www.ismll.uni-hildesheim.de/mymedialite/">MyMediaLite</a> and <a href="http://lenskit.grouplens.org/">Lenskit</a>), backed by open, intelligent, and collaborative people which are there for you to explore and learn from.

<iframe src="//www.slideshare.net/slideshow/embed_code/key/DLT29XgAtPfGd8" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/neal.lathia/recommender-systems-14570081" title="Recommender Systems in 2012" target="_blank">Recommender Systems in 2012</a> </strong> from <strong><a href="https://www.slideshare.net/neal.lathia" target="_blank">Neal Lathia</a></strong> </div>

