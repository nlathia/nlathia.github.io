---
layout: post
title: "Discussing the Netflix Prize"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

After my last <a href="http://mobblog.cs.ucl.ac.uk/2009/06/27/netflix-prize-nearly-finished/">blog post</a>, I was contacted by a journalist who wanted to discuss the effects of the Netflix prize. It seems that now that the competition is winding to an end, one of the real questions that emerges is whether it was worth it. Below, I'm pasting part of my side of the dialogue; other blogs are <a href="http://blog.mediaunbound.com/?p=419">posting similar discussions</a>, and I'm curious as to what any of you fellow researchers may have to say.

**(Disclaimer) A Comment on My Comments**

What the leaders have achieved is remarkable; it's a huge feat and they deserve the prize. They have also accomplished the 10% improvement while consistently sharing their insights through a number of great publications - I comment without intending to detract from the difficulty of the problem or the great work they have done over the past 2+ years.

Since the contest is in the last-call stage, I can only comment on algorithms that have been disclosed so far - I'm assuming that they haven't radically changed their methods since winning the 2007 and 2008 progress prizes. Since the qualifying team is a combination of leading teams, it is likely that they have blended the results that each team was getting to make it over the final hurdle.

**Will the 10% make a difference to the customers?**

Well, it is unlikely that Netflix will be able to use any leading solution from the competition in its entirety. Here's one example why: many algorithms have been leveraging the so-called 'temporal effects' to improve their predictions. Basically, they were looking at how ratings vary according to when they were entered (for example, you may be inclined to rate movies lower on Wednesdays than on Fridays). The hidden test set that competitors had to predict included who (the user id), what (the movie id) and when (date) the rating was input (only the rating needed to be predicted) - so using the temporal effects provided a benefit. However, real systems will not know both the what or when that competitors had available - so unless Netflix is prepared to update its recommendations every day, these temporal effects can not be used.

There is also controversy in the field as to whether RMSE is a good measure (in terms of translating to good recommendations), which has been around for a while. Some researchers have said that accuracy actually hurts recommender systems, others would take the more conservative view and say that accuracy is only one dimension of a good recommendation. Overall, the difficulty of researching collaborative filtering is that we are trying to design algorithms that make people &#8220;happy,&#8221; by giving them good recommendations - but this is a very (very, very) subjective quality.

In summary: the customers may see a difference - perhaps if only because they know that Netflix has invested over $1 million in improving their algorithm, perhaps because Netflix will include some of the insights gained in the past years - but it is not as simple as taking the algorithm the team has produced and letting it loose on all its customers.

**Do you think it's quite surprising that an improvement of 10% has even proved possible?**

No - mainly because of what I said above (the teams use lots of information about, and smart methods to reason about, what they are predicting). They have also been receiving feedback on how well their methods have been performing in all the submissions prior to the one that had more than 10% improvement - and have been tuning according to that feedback. Unfortunately there are still differences between the set up of the competition and how a deployed system will work.

This is related to some recent work <a href="http://technocalifornia.blogspot.com/2009/05/netflix-prize-what-if-there-is-no.html">presented at UMAP</a>: I think the key insight the work is that people to exhibit natural unreliability in their rating (and therefore it was possible to question whether 10% was possible or not) - but the algorithms that researchers have been designing assume that the number that people input is the ground truth.

**What other factors do you think are important in offering a rental prediction?**

There are quite a few I can think of - essentially similar to the reasons why people recommend things to each other. Some ideas have been floating around:
* Diversity: if you rate Lord of the Rings, are you being recommended Lord of the Rings II and III? Are you being recommended the same movies week after week? Lack of diversity can definitely lead to boring recommendations. (Some unpublished/ in progress work I've been doing relates to this).
* Novelty: How can new (good) movies be spotted and recommended- before everyone rates them?
* How can new users be given good recommendations before they have rated tons of movies? (Sometimes called the 'cold-start' problem)
* Popularity: There is some work that shows that recommender systems tend to recommend popular things - how can niche content be recommended to the right people?
* Serendipity: How can users be given 'surprising' recommendations - recommendations that lead them to discover and like new movies that they may have been otherwise averse to.

**Update:** The article is now available, on <a href="http://www.newscientist.com/article/dn17393 ">New Scientist</a>.

