---
layout: post
title: "Data Science Hackathon"
description: Originally published on urbanmining.wordpress.com
categories: [data-science]
---

Last weekend I attended the <a href="http://datasciencehackathon.com/" target="_blank">Data Science Hackathon</a>. It was a pretty simple idea: given a dataset from a city's air-sensor stations the goal was to create a model that could predict the city's air quality. The competition took place over 24 hours across a number of cities around the world and was run using the <a href="http://www.kaggle.com/" target="_blank">Kaggle</a> platform.

<strong>The Prediction Problem</strong>

The basic task of the competition was to come up with a model that would predict air quality in a city given a set of stations that are distributed around it. Air quality was translated into predicting a set of target variables. What were these target variables/stations reading? We don't know. All we knew was a bunch of historical values for each target, where the stations were (lat/lon) and some extra historical stuff like wind speed and direction. The historical data was further divided into "chunks" of time, so we didn't have a straight line back in time of data.

Teams were limited to making 8 submissions per day and the error was measured using the well known Mean Absolute Error.

<strong>The London Branch of the Hackathon</strong>

Was held at the <a href="http://hubwestminster.net/" target="_blank">Westminster Hub</a>. A very nice venue, with lots of space, lots of (great) food and about 50 (or so I've heard) people in attendance. Flawless organisation. We also had the added benefit of having a reward that was exclusively for the attendees who were participating. Once the competition was launched, people quickly broke off into small teams and got hacking, and continued to do so for the full 24 hours. A handful of people went to sleep at varying times, but the corner I was sitting in was buzzing with activity until the final few minutes. Perhaps my only criticism of the competition was that there was relatively little interaction happening between the groups. Of course, we were competing with one another.. but we were also competing with the rest of the world!

The team beside me (Ferenc Huszar, Jose Miguel Hernandez Lobato, Dan Harvey, and Jedidiah Francis) took the first place - well done guys! I was excited that my team was 3rd, until the competition ended and we were knocked down to fourth place by 0.0004. Better luck next time.

<strong>Hacking for 24 hours: Many things didn't work</strong>

This hackathon was an interesting opportunity to sit down and focus on one problem for 24 hours. I haven't had an all-nighter like this since my undergraduate days, and it's surprising just how focused you can become after a few hours when you are dedicated to one task and have shut yourself off from the usual distractions that surround us during the normal working day.

Like most other teams, we began by spending what felt like an inordinate amount of time getting to grips with the problem and analysing the correlations between the different variables that we had to predict (see some visualisations on the Kaggle forum <a href="https://www.kaggle.com/c/dsg-hackathon/forums/t/1820/pretty-correlations/10595#post10595" target="_blank">here</a>). We then spent a bunch of time "getting ready:" splitting the data into the format that we wanted it to perform different tests, and making a new training/test set from the training data so that we could test models without burning one of our precious submissions. In fact, all of the time that we took trying to get our heads around what needed to be done and how we could go about doing it meant that we didn't make any submissions on the first day. So much for being precious about the submissions!

We then went straight into implementing a variety of models. We had a bunch of ideas: we wanted to devise predictions based on (a) each target variable, which we decided to model separately with time - which was the most "obvious" direction of work and (b) station, since we assumed that the different target variables would differ across stations and (c) space - we thought that there would probably be some geographic effects in play, or at least some measurable similarities across stations.

Needless to say, most of our efforts failed. Since we were being so precious about "saving" the 8 submissions that we had (since we missed out on making the first 8), it was quite late in the competition that we found out that our internal testing results were not reflecting similar improvements (or even similar performance) as the official results. This was quite disappointing, particularly since we were already so many hours into the competition and were quite groggy at that time.

We also spent a lot (too much?) time either implementing different approaches or learning to use tools that had them implemented already. At least I finally got a chance to learn how to use Random Forests in R, but the way I had them set up did not outperform any of the baselines.

In the last few hours, I went about using up all our last submissions with "dumb" things. Quite surprisingly, this is where we made all of our improvements (and landed 4th in London). Our final model took the highest baseline ("hourly average per chunk"), replaced the arithmetic mean with the geometric mean (to deal with noise) and averaged that with a weighted moving average. <strong>Lesson learned: </strong>why didn't I do all these "simple" things first?

<strong>Some thoughts</strong>

One of the comments that I heard a few times was "if only I had a week to look at this." Overall, I think that this statement was somewhat reflected in the competition results: the global winner was 0.06 better than the highest baseline, and the winning Londoners (team "Londoners") were 0.04 better than the baseline.

Without detracting from the winners' great achievement (given the short time to learn about the problem and implement the solution) I feel that nobody did quite well compared to this very simple baseline. Perhaps this is a good time to re-ignite the domain expertise vs. machine learning debate: would we have done better if we had known what the target variables were?

I'm looking forward to participating in the next hackathon, which will be about music. It was also great to get some sleep on Sunday night!
