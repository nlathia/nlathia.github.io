---
layout: post
title: "Collaborative Filtering is Strange"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

I just submitted a paper that includes some very strange results that I got when playing around with the different collaborative filtering techniques on the MovieLens dataset. The work was a direct follow up to the new similarity measure I wrote about in my <a href="http://mobblog.cs.ucl.ac.uk/2007/06/07/private-collaborative-filtering">previous post</a> on privacy in distributed recommender systems, and begins by reshaping the way we think about (and try to visualise) collaborative filtering.

Most of us, after all, are part of the networks research group here at UCL-CS. Recommender systems, based on collaborative filtering (whether they are distributed or not) can also be considered as a form of network, where a user is a node, and each user is connected to all of the other nodes with bi-directional links that are weighted according to how similar the corresponding users are. These weights will be determined by how we measure similarity (Pearson Correlation? Vector Similarity? Somers' d?). Users then generate predicted ratings for items by aggregating opinion information from a select number of neighbors (this selection defines the user's neighborhood)

This kind of perspective allows us to do two things to help us see the effect of correlation coefficients on the entire network. First of all, we can explore the distribution of the similarity values in the network. In other words, we can ask: what proportion of the links in the network are weighted between (say) 0.8 and 1? What about other ranges? The paper shows the full results, with some interesting results. For example, all Somers' d values fall between -0.05 and 0.05: maybe it is not such a good similarity measure after all?

The second step focused more on the performance evaluation of these 'networks, in terms of how well they can generate predicted ratings. Rather than just comparing the performance of the different similarity measures we know about, we also built a network of recommenders with random-valued weighted links. The strange thing about this kind of experiment is that it completely disregards any profile information; it's just a random number in a fixed range. The only thing that is stranger than the experiment is the result. The mean absolute error of the predicted ratings, when using random-valued links, was very similar (and sometimes slightly better!) than all the coefficients derived from the user profiles!

The difficult question: why does this happen? I leave the full discussion to the paper...

