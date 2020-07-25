---
layout: post
title: "Music Data Science Hackathon (Extended)"
description: Originally published on urbanmining.wordpress.com
categories: [data-science]
---

(cross-post/extended post-remix from the <a href="http://datasciencelondon.org/" target="_blank">Data Science London blog</a>)

After participating in the <a href="https://urbanmining.wordpress.com/2012/04/30/data-science-hackathon/" target="_blank">first Data Science London (DSL) hackathon</a>, I crossed to the other side of the table and was a 'Data Team Leader' for DSL's second hackathon. This one was all about the intersection of music and data science; in particular, the goal of the hackathon was to explore the potential around <a href="http://musicdatascience.com/emi-million-interview-dataset/" target="_blank">EMI's 1 million interview dataset</a>.

I had a lot of fun working as the Data Team Leader in this hackathon, and I really enjoyed being part of this project since day one. What was being a data team leader all about? Well, there are (too often) times that having a lot of data isn't the only pre-requisite for running machine learning driven competitions. What should the prediction task be? A well-defined competition can't leave this open. What data should participants be given? What kind of error metric should be used? How should the data be anonymised? How should it be formatted - to be quickly understandable and parse-able? There were the kind of questions that I tackled and, although (as the kaggle forum will show) the results weren't perfect, it seemed that we managed to pull it together to have a great, successful hackathon.

As for the rest of the hackathon, here is a brief report and some of my notes:

## The Hackathon

The <a href="http://musicdatascience.com">**Music Data Science Hackathon**</a> has been one of the most successful Data Science London events to date; it attracted over 175 data scientists across the world organised in 138 teams. The contestants posted 1,399 submissions. The task involved taking a large sample of EMI’s market research data and using it to develop models that can predict how much customers are going to like a particular artist’s track, by accurately estimating the ratings that they give to them.

There were two main benefits of structuring the hackathon’s task this way. First, it gives us a very quick glimpse into the goldmine of data that EMI has collected through their market research: this task actually used a small sample of all the data they have, and many participants have already asked whether they can use the data, outside of the competition, in their research. It also was structured around a well-known and fun machine-learning problem (rating prediction), which allowed participants to quickly apply their expertise to the problem at hand.

## The Participants

The **participants** included a range of academic staff, research students, machine learning enthusiasts, and employees of tech start-ups; a quick look at the top-10 of the leader board also shows a number of different countries.

I’m particularly happy to have seen so many familiar names in the leader board, including the great folk from MusicMetric, Dell Zhang (who won the London on-site competition), Tamas and a team from UCL Computer Science, and friends for Germany, such as Zeno Gantner, who has developed the MyMediaLite tool.

## The Solutions

The **machine learning approaches** that were used in the competition cover a number of state-of-the-art algorithms. Some of them are becoming familiar names in the context of Kaggle competitions; others gained notoriety and research attention throughout the $1 million Netflix competition. The most actively discussed approaches included:
* Matrix Factorization (&amp; other collaborative filtering approaches)
* Random Forests
* Gradient Boosted Trees (GBTs)
* Restricted Boltzmann Machines (RBMs)

Twenty-four hours is a very short time to tackle data mining problems; the hackers used a mixture of their own coding skills (using languages like R and Python) and freely accessible machine learning tools. Many of the participants are also actively sharing their approaches to the problem on the Kaggle forum. Two tools that were most discussed in the forum were:

MyMediaLite: <a href="http://www.ismll.uni-hildesheim.de/mymedialite/">http://www.ismll.uni-hildesheim.de/mymedialite/</a>

LibFM: <a href="http://www.libfm.org/">http://www.libfm.org/</a>

Although participants were mostly focused on improving their models’ accuracy, a number of insights about the data and its predictability emerged. Some of them reflect well-known aspects of rating-style data (e.g. respondents tend to anchor toward particular values). However, one of the biggest highlights relates to the novelty of the dataset that was released: _How much does demographic data count?_ There were mixed comments about the utility of using demographic and user profile data in order to improve the accuracy of rating prediction. For example, one participant found that a person’s working status is not indicative of their musical preference. Other participants used all the data as features of their models, so finding the answer to this question would still require a bit of research!
