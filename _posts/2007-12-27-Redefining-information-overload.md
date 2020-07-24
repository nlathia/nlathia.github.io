---
layout: post
title: "Redefining Information Overload"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

The other day I was sitting at Gatwick airport waiting for my flight home to Italy to spend Christmas with my family. I got my flight with Easyjet- and when I bought the ticket online I was also able to sign up to one of their new, free text-messaging services:
* Some of the texts were **very helpful**: the morning of my flight I received a text with my flight details and confirmation number, information that I may usually scribble on a piece of paper or the back of my hand. Result: no paper, and clean hands (happier parents?)
* Some of the texts could have made us of some **location information**: a text said (in a nice way) "go to your gate" ... umm, should I reply to the computer and tell it I'm already there?
* Other texts were **interesting, but I didn't need them**: "Use this text to get 0% commission on currency exchange." I have some Euros in my pocket. Can you send me this text again when I do need Euros? (Maybe I'll tell you when?)
* Other texts were **just useless**. "Go to shop X and get Y% discount with this text." I won't say what the shop is, let's just leave it at the fact that its contents don't quite fit my profile (specifically gender). Why do you keep interupting me from the book I was reading to give me this useless advertisement? My only current solution is to unsubscribe- but I'll lose all the information I liked then!

To any reader of this blog, these \~4 text messages are reminiscent of Daniele's work on trust models on mobile phones, and I was thinking about how it overlaps with all the work on recommender systems and collaborative filtering. Collaborative filtering, by growing out of information retrieval work, is still bound, or perhaps tangential, to search (as was discussed at <a href="http://mobblog.cs.ucl.ac.uk/2007/10/23/recsys-2007/">RecSys</a>); how can we provide query-less results to users based on the (possibly implicit) information they provide? To that extent, there are a lot of ways it can spill over into the mobile world- either by using the mobile phone as a mere interface to centralised servers, or profiling users in other ways, such as location, co-location, content they carry, etc (the sort of things related to Liam's work?). As we can see from the sort of things Google is doing, people can be profiled for (nearly?) everything they do.

However, I think that all of these methods rely on two points:
* "Recommendations Push:" I am looking for content. Recommender systems are successful online because people want to explore the results they give. In other words, when online I am trying to pull useful recommendations from the system. Text messages being sent to me is not the same; it is Easyjet pushing recommendations my way. I have to check my phone and make sure its not a friend texting me.
* Recommender Trust: I trust Easyjet to only send me the advertisements they think are right for me (regardless of any accuracy considerations). In this case it feels like Easyjet is more interested in sending me advertisements of shops that are in the same airport that I should be in.

Conclusion? In the mobile world, the problem of information overload is redefined. It is no longer "there is too much content for the user to find all that he/she is interested in."  My rough definition would be "if all the content gets pushed to all the users, their phones will never stop vibrating, they will not take any action on the content they receive, and they are probably going to turn their phones off."

