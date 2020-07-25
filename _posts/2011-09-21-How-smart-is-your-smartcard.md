---
layout: post
title: "How Smart is Your Smart Card?"
description: Originally published on urbanmining.wordpress.com
categories: [research, transport]
---

When presenting my paper at ACM Ubicomp 2011 (today, in Beijing, China), I went for something slightly different than what I normally do. I anticipated that I would be massively jet-lagged and wrote a script. The only other time I've done this is when I had to give a talk in Italian, which had worked well. In the end, I didn't exactly stick to the script, but I definitely found it helpful. And, if you missed it, then I have it all below for you to read (the numbers correspond to the slide):

<iframe src="//www.slideshare.net/slideshow/embed_code/key/27jRlP149fssEU" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/neal.lathia/how-smart-is-your-smart-card" title="How Smart is Your Smart Card?" target="_blank">How Smart is Your Smart Card?</a> </strong> from <strong><a href="https://www.slideshare.net/neal.lathia" target="_blank">Neal Lathia</a></strong> </div>


Hello, my name is Neal. Today I'm going to talk about some research that links pockets to policies and our smart cards to future ubicomp applications. And it's all set in the city I live: London, England.

London is the biggest city in the United Kingdom – by most measures, it is also the largest urban area in the European Union. It is a wide, exciting, and diverse hub; a meeting place of a variety of cultures; a blend of modernity and history.

The symbols of the city resound across the world. Who doesn't recognize the tube, the infamous double decker buses, the mind the gap? No matter where I go, everyone who has visited London has a unique story to tell about their experiences in the UK's capital.

London has been in the global headlines recently due to the violence and looting that erupted in a number of its boroughs. In fact, violence was a part of how I first experienced London as well. In one of the first evenings in the city a friend of mine was mugged right before my eyes. His pockets were emptied – I can't tell you why mine weren't – and the thief made off with his mobile phone and wallet.

Of course, these kind of experiences remind us about just how much of ourselves we carry in our pockets. From ids to credit cards, photos, music, mobile phones: our pockets are repositories of stories, memories, friends, preferences, and (increasingly) sensors. A lot of the research that comes out of this community emerges from our pockets.

Today I'm going to talk about a sensor that over 80% of Londoners carry: the Oyster card. These cards were introduced in 2003 and were built on a simple premise: they are there to facilitate payment for public transport. Cities across the world are adopting their own systems – a smart card is the modern day badge that says “this is the city I come from.” The amazing thing about these cards is that, while being utterly simple, they produce a gold mine of data. Data that goes well beyond the granularity of mobile phone data – the public transport authority in London knows where you live, how you move, if you go for buses rather than trains, when you start moving and where you go (in their system), how you spend your money on transport tickets, whether you have a disability, you're retired, or if you are a student. And that's just written in the data: the days of activity inference and mobility detection are over.

My work over the past couple of years has been about what this data can tell us and what we can build using it; about what would happen if Oyster cards could talk back to us, or if systems were in place for us to interrogate the data it generates: what insights does it offer, and who could benefit from them?

We compressed these questions into the title of the paper I'm presenting: how smart is your smart card? As I give you a brief taste of the paper's contents, the question to keep in mind is: what would you build if you could put a sensor like this into the hands of every resident of your city? So here goes.

We first looked at how this data reflects against people's perception of the way they move about the city. To do so, we designed an online survey where we raffled off a prize in exchange for people's opinions and Oyster card numbers: a direct link between what people think they do with public transport and what their smart card measures that they actually do.

Transport for London gave us an 8-week Oyster card history of 85 of our survey participants, as well as a couple of other datasets that sample the wider population. A few words on the latter: one is a 5% sample of people over two different 83-day periods, the second is a 100% sample over an entire month.

Let's look at a specific example of what the link between survey and smart card can tell us. Part of the survey asked respondents to estimate how much and when they travel – how many trips per day, on average? What times do you travel? If we compare the trips that people claim to make with those that they actually do, we find that people consistently over estimate how much they use public transport. In particular, they are better at estimating how many trips they take on a typical week end day rather than week day, even though they generally say that their week end travel tends towards the irregular.

When it comes to travel times, we found that people become more accurate over the week, perhaps due to commitments related to work. All these observations reflect one point: just how difficult is it for people to estimate how much they are going to need the public transport system?

This question becomes particularly relevant when it comes to buying tickets. We also examined relation between perceived and actual payment. Travellers in London can add credit to their smart cards and pay on a per-trip basis, the infamous “pay as you go” scheme. We asked users how much they “top-up” by when they approach the machines, and compare the ranges they reported (in orange) with the average of what they actually do (in blue).

We can see that people are quite close, but notice the anomalies: it's 20% of the users.

If we compare this to the wider population, another observation emerges: nearly half of the 5% data, which contains over 3 million transactions, was for less than five pounds. Yet, very few survey respondents claim to make these kind of transactions- of course, perhaps this reflects on who we managed to find for the survey.

The paper details a number of other insights, it even discusses a few reasons as to why we may be observing these kind of phenomena. We found a high usage of modalities that respondents claim to never use, particularly for low-usage travellers. We noticed a surprisingly high average of travel to stations that users did not list as typical. Each time, the data tells a slightly different story than what the people say they do.

So why does this matter? Let's return to the central question: what would you build if you could put a sensor like this into the hands of every resident of your city? If the data were open, you could easily envisage mobile applications that re-align perception with actuality: for increased awareness, to promote sustainable transport choices, to give people real-time and contextualised, relevant information; a foursquare of the future that takes into account how you sprawl across your city to give you better recommendations; a system that helps you manage your fare paying habits. The list goes on.

But building things for travellers is not the end of the story. Remember that each city is not just a collection of residents: it is a complex blend of structure and policy, which produce a mixture of incentives for you to behave in a certain way. So we ask: does smart card data have something to say about this too?

Let's look at some examples. In one of the reference datasets, we have just under 200,000 student smart cards. These cards allow students to obtain discounts on travel cards – a ticket with a one-off payment that allows for unlimited travel within a certain designated spatio-temporal area – but does not give them discounts for pay as you go. We have about 10 million trips made by these students, and 50 million trips taken by everyone else, and, although students could access discounted travel cards, they tend not to.

Even if you bin people according to their travel needs (or how many trips they make in the dataset), we still find that the students tend to be more on pay as you go. Why?

One respondent gives a potential reason: “as a student with a flexible timetable, it isn't always obvious whether a travel card is a better deal than pay as you go.”

Here is another example. On the pre-pay system, once you reach a daily spending limit, travel becomes free for the rest of the day – a system called daily capping. What does this do to user behaviour? In the 100% dataset, we have close to 100 million trips taken using pay as you go, which we can divide into the paid-for “un-capped” group and the free “capped” group. Of course, if this "switch to free" had no effect, we would expect there to be little difference between the groups.

Instead, in the former, roughly half of the trips are taken on buses. Yet when travel is free, suddenly this proportion is up to 73%: buses are suddenly way more attractive. This seems to be another example demonstrating the power of free and how it influences our decisions.

These examples are a brief look into what the data can offer. In fact, the incentive and fare structure of the city is fairly complex. But the conclusion persists – couldn't policy makers and transport operators use these insights to guide their policies?

So that brings me to the end of this quick tour of the potential locked into this data. I hope that I've managed to convince you that the potential this data holds is far greater than the 15 minutes I have to talk to you about it. Perhaps you have ideas of what you would build, or what science you would do, if you could place one of these sensors into every citizen of your city. In fact, I hope you are already mentally drafting the e-mail you could send to the public transport authority in your city.

I have a couple of other papers that were published recently about services that can be built with this kind of data: one is about personalised information services for travellers, while the second aims at building systems that help travellers save money.

As you're already wondering, I am not in the position to share this data with you, due to privacy concerns (and a non-disclosure agreement): but, as I already mentioned, London's Oyster card is far from unique, and I hope to see studies using this kind of data from your city very soon. Thank you!
