---
layout: post
title: "Strange Bugs"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

I recently went to an introductory course about the new UCL-Dell supercomputer <a href="http://www.ucl.ac.uk/media/library/Dell">Legion.</a> It was a 2-day course, with plenty of presentations about optimizing/ parallelizing code, and some hands-on. Other than a few quirks (the system is still being tested), it worked great- and it's very exciting to have that (huge) amount of computational power available. The people are also very nice- more info on them <a href="http://www.ucl.ac.uk/silva/research-computing/">here</a>.

Of course (just like the Condor pool in the deparment), these systems aren't really made for Java. So recently I've been porting all my Java collaborative filtering code to C++ (Note to Java haters: it worked fast/don't be a hater). 

When I first ran my kNN collaborative filtering experiments, I noticed that the C++ version produced _less accurate_ results (on the MovieLens dataset) than the Java implementation. So the long hunt for what was wrong began, and it turned out to be a very strange.

Here's the gist of it: any user-user kNN prediction in collaborative filtering is made by a weighted average of neighbour ratings. You take your neighbour's ratings, subtract the respective user's mean from each rating, do an average- weighting each rating by similarity (or <a href="http://mobblog.cs.ucl.ac.uk/2008/02/28/filtering-by-trust/">trust</a>!)- and then add your own mean to that. So neighbours who have not rated the item in question do not contribute to the prediction. In my C++ implementation, neighbours _who have nothing to say_ (`rating - mean = 0`) did not contribute to the prediction.

Result: less accuracy. Lesson learned: the importance in predicting is not only how much your neighbours like or dislike the item, but also whether they have rated it or not! A shrug is just as much of a judgement as a thumbs up or down. (Ok, maybe a silly mistake to make- but I've never seen this written explicitly anywhere!)
