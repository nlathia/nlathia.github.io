---
layout: post
title: "YouTube Behavior"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

I read an interesting paper, "Identifying User Behavior in Online Social Networks," by Marcelo Maia, Jussara Almeida and Virgílio Almeida. It was presented yesterday at the <a href="http://socialnets2008.msra.cn/program.html">First International Workshop on Social Networks</a> (co-located with <a href="http://www.dcs.gla.ac.uk/Conferences/EuroSys2008/">EuroSys 2008</a>).

The paper uses an interesting dataset: a social network based on the user-subscriptions on <a href="http://youtube.com/">youtube</a>. In other words, if I subscribe to your video uploads, then I link to you in the network. Here is a very brief summary: How is it possible to classify users according to different behaviors? An answer to this question would help specialists design their sites according to the target audience; however, trying to identify groups of similarly-behaved users based on individual attributes does not produce useful results. So what can be done? More informative traits can be used: the _social interaction_ attributes. For example, consider the subscription network of youtube: considering each user's in-degree (people who subscribe to that user's content), out-degree (number of subscriptions), and reciprocity (mutual subscriptions), as well as number of uploads, watches, and channel views, allows for user behavior to be classified into five groups. The three main groups that appear are the content producers, consumers, and mixed producer/consumers. The last two are the old-possibly inactive users and those who small-degree/high clustering coefficient (the cliques).

The users in this dataset were classified using <a href="http://en.wikipedia.org/wiki/K-means_algorithm">k-means</a>, which typically relies on a pre-defined value of k to work. Another interesting contribution is a method that finds what k to use, based on balancing the proportion of inter- and intra- cluster distance properly (details in the paper). Of course, just like needing to specify k, a more general weakness of these techniques seems to be that you need to know what you are looking for before you can find any structure. In other words, if the authors had decided to cluster based on different social-interaction attributes (or social-net graph properties), maybe their results would have been remarkably different?

There are a lot of other interesting papers that use youtube datasets, including <a href="http://www.imconf.net/imc-2007/papers/imc131.pdf">this one</a> that looks at how content popularity on the site fluctuates.

