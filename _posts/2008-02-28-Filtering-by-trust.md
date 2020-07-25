---
layout: post
title: "Filtering By Trust"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

A lot of the posts on this blog discuss the idea of computers using trust in different scenarios. Since starting as a research student, and reading a lot of <a href="http://mobblog.cs.ucl.ac.uk/2007/10/31/lightweight-distributed-trust-propagation/">good papers</a> about trust, I still find the idea slightly strange: is trust something that can actually be quantified? Are these computers actually reasoning about _trust_? (what is trust?)

Trust, however, seems to have a place in our research. It gives us a metaphor to describe how interactions between "strangers" should happen, a platform to build applications that feed off these ideas, and a language to describe and analyse the emergent properties that we observe in these systems. So, even if a trust relationship may be a concept that cannot be boiled down to a deterministic protocol, it gives researchers a model of the world they are exploring.

I decided to apply this metaphor to collaborative filtering, an algorithm that aims to generate recommendations by assigning neighbours to each user. Usually this assignment is done by computed similarity, which has its downfalls: how similar are two people who have never rated items in common? What is the <a href="http://mobblog.cs.ucl.ac.uk/2007/09/21/collaborative-filtering-is-strange/">best way of measuring similarity</a>? Applying the metaphor of trust, instead, aims at capturing the value that each neighbour gives to a user's recommendations over time, and value is not only derived from agreement- but also from the ability a neighbour has to provide information. While similarity-based algorithms use neighbour ratings, interactions based on trust acknowledge that information received from others is subject to interpretation, as there may be a strong _semantic distance_ between the way two users apply ratings to items.

Trust is a richer concept than similarity by favouring neighbours who can give you information about the items you seek and offering a means of learning to interpret the information received from them. Evaluating this technique improves on the basic similarity-driven algorithms, both in terms of accuracy and coverage: modeling the problem as an instance of a trust-management scenario seems to offer an escape from traditional pitfalls of similarity-based approaches. I leave all the details to the paper, "Trust-based Collaborative Filtering," which is due to appear in <a href="http://www.ntnu.no/videre/konferanse/IFIPTM08/">IFIPTM 2008</a> (thanks to Daniele for his great comments and feedback).
