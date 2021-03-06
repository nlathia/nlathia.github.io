---
layout: post
title: "Tutorials at RecSys 2008"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

Yesterday was the first day of <a href="http://recsys.acm.org/">RecSys 2008</a>, and was dedicated to three very interesting tutorials:

## Robust Recommender Systems

Robin Burke introduced the wide range of attacks that typical collaborative filtering algorithms are vulnerable to; scenarios that arise when people attempt to force, rather than express, opinions. An attack was strictly defined as a set of profiles intending to obtain excessive influence on others, which can be aimed at pushing (making recommendation more likely) or nuking (i.e. recommendation less likely) items. His talk was an interesting blend of attack strategies, knowledge that attackers need to have, and a high-level description of approaches aiming at preventing or fixing the system when attacked. Of course, there are strong overlaps between this work and work in other areas (p2p trust, adversarial information retrieval, search engine spam..); I particularly like this area as pushes the point that recommender systems are about people/dynamic datasets, and not just prediction.

## Recent Progress in Collaborative Filtering

Yehuda Koren (who has recently moved from AT&T to Yahoo! Research) gave a tutorial about the leading approaches in the Netflix prize competition. The techniques he described blend matrix factorisation and neighbourhood models, and include a number of other factors (such as user biases and time) that result in techniques that have multiple-billions of parameters (and the resulting ranking of team BellKor <a href="http://www.netflixprize.com//leaderboard">in the competition</a>). His work is remarkable and worthy of the progress prizes he has been awarded thus far. He also explored alternative techniques of evaluating recommender systems, explaining his take on evaluating top-N recommendation lists.

## Context-Aware Recommendations

Gedas Adomavicius and Alex Tuzhilin introduced their work on incorporating context into recommender systems, including pre-, post-, and hybrid-filtering of recommendation algorithm results based on user context. A running example that was repeated throughout the tutorial was going to the theatre with your girlfriend on the weekend: if you always watch comedy, then your recommendations can be filtered to match what you did in previous instances of the same context (i.e. you can be recommended comedy). They have done a lot of cool stuff on multi-dimensional recommenders, extending the common rating scales into cubes of ratings, and stressed more than once that this is virgin territory. Their work is also impressive, but raised a few questions. For example, should context be described by a well-enumerated taxonomy? Moreover, if you always watch comedy at the theatre with your girlfriend on weekends, then why should you need a recommender system in the first place (especially a collaborative one- what happened to serendipity or diversity)? They have a number of papers that are worth reading before trying to answer these questions!

