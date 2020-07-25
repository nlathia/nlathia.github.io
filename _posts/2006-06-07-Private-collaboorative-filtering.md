---
layout: post
title: "Private Collaborative Filtering"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

Recently, I submitted my first paper to [RecSys 07](http://recsys.acm.org/), "Private Distributed Collaborative Filtering using Estimated Concordance Measures." Even though it is not particularly about mobile-stuff, here's a quick run through the main ideas:

Collaborative filtering is a means of using a community's behavior, within a certain domain (movies, music), to support reducing the amount of information that each individual needs to looks through to find their items of interest. It is the dominant method behind recommender systems (such as Amazon, etc), and is based on a simple idea: people with previous shared interests will, most likely, share common likes and dislikes in the future. So, to predict how much I will like a certain item, the system first compares my rating history to all the other users to produce similarity measures, and then uses these similarity measures to compute a weighted average of how much they enjoyed the item in question.

The problem is that this method allows for no privacy. Particularly in a distributed environment, where I do not know how much to trust unknown neighbors, I do not want to have to share my entire rating history (i.e. my profile) with them, to find a similarity measure- thus discouraging cooperation, which is harmful to collaborative filtering. The actual similarity measures (the most famous being the Pearson correlation coefficient), simply cannot be found without full profile disclosure.

Therefore, in the paper we proposed a new similarity measure, based on concordance. You and I rate a movie concordantly if we both rate it above or below our mean rating (in other words, we agree about whether to give it thumbs up/thumbs down). If you hated the movie (and rated it below your mean), and I loved it (rating it above my mean), then we disagree- the ratings are discordant. If one of us has no opinion about the movie, we just say it is tied. The new similarity measure is derived from the number of concordant (C), discordant (D), tied (T) pairs between our rating sets, and the size of the set N, and this similarity measure works just as effectively (in terms of generating recommendations) as the Pearson correlation coefficient.

So how can this be used to include privacy in collaborative filtering? If you and I share a common randomly-generated set, and report to each other the number of C, D, and T pairs we have with the random set to each other, these values can be used to place bounds on the actual values of C, D, and T pairs we have with each other: we can estimate our similarity without ever sharing any profile-specific information, only sharing abstracted profile information derived from a comparison with a random set. Privacy is not breached, and, along with an incremental learning technique (future work) about how to evolve the similarity measure between recommenders, we can start collaborating with each other!

If you're interested in the details (and the evaluation), I'll post the paper on my web site soon (when I hear back from RecSys!)
