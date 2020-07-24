---
layout: post
title: "Data as a mirror"
description: Originally published on urbanmining.wordpress.com
categories: [research, transport]
---

"Big data" is a great catch phrase online. Every time I hear it used, it seems to be that what used to be big data is now mediocre-sized data, and what used to be medium sized is laughably small. There is certainly a lot of exciting research going on in this space. One of the things that bugs me, though, is that a lot of effort is being pushed into what can be done with this data, with (seemingly) less thought being given to how this data came about in the first place.

I'm very much to blame for this too. The last two papers I wrote using data from Transport for London's (TfL) <a href="http://en.wikipedia.org/wiki/Oyster_card" target="_blank">Oyster cards</a> (IEEE ICDM 2010 <a href="http://urbanmining.wordpress.com/2011/01/11/personalised-public-transport/" target="_blank">blog post</a>, and ACM KDD 2011 <a href="http://urbanmining.wordpress.com/2011/05/02/addressing-overspending-on-public-transport-using-recommendations/" target="_blank">blog post</a>) focused on what systems could be built to help travellers get around town and save money. So, when designing a <a href="http://urbanmining.wordpress.com/2011/01/11/survey-londoners-how-do-you-get-around-town/" target="_blank">web survey</a> about travel habits, I thought it would be nice to step away from this frame of mind and look at, instead, the <em>how</em> and <em>why</em> questions instead of the <em>what next</em> question.

If you are familiar with TfL's system, you'll know that you can go and request an 8-week history of your data at any time (after 8 weeks, they anonymize your data). 85 of the respondents to my survey answered all my questions as well as giving me their Oyster card numbers and permission to ask TfL for their history; TfL was very helpful in getting the data to me.

The result was 3 datasets: (1) Subjective answers to a range of travel questions, (2) Transit records for the same individuals, and (3) a large-scale dataset anonymised travel records that I have used before. Lots of fun to be had here; the resulting paper has just been accepted to ACM Ubicomp (it's on my publications <a href="http://www.cs.ucl.ac.uk/staff/n.lathia/publications.html" target="_blank">page</a>). Here is a short pitch of what it contains:

<strong>Data as a Mirror: Our Self-Image</strong>
First, I focused on datasets (1) and (2). How do they compare to each other? What do travellers think they do, and what do their Oyster cards say that they have been doing? Some of the results include:
<ul>
	<li><strong>Estimating travel needs:</strong> We are bad at estimating how often we will use public transport. However, we are better at estimating how many trips we will tend to take on week ends, even though we tend to rate our week end trips as highly irregular. We are better at estimating what time we will be travelling (rather than how often we will do so).</li>
	<li><strong>Hidden trips: </strong>Over half of the respondents made a claim like "I never use the bus during week days" but actually did. Moreover, nearly 65% of respondent's trips were to/from stations that they did not list as typical.</li>
	<li><strong>Hidden savings: </strong>We asked how much people typically top up by (each time they go to a machine to buy credit) and then checked out how much they actually do. About 20% of the respondents over-estimated their typical transaction.</li>
</ul>
<strong>Data as a Mirror: the Effectiveness of Public Policy</strong>
Discovering that there are differences between how we perceive and actually use systems is becoming more commonplace. The second half of this work, instead, turned to design vs. usage: we looked at the behaviours that transport operators are trying to elicit from their passengers, and whether they actually appear in the data:
<ul>
	<li><strong>Do peak-time fares encourage people to avoid peak-hour travel?</strong> It seems not; instead, it guides their purchasing behaviour.</li>
	<li><strong>Do travel cards and free travel encourage greater usage?</strong> It seems like this one works! When people have travel cards (i.e., they don't have to pay on a per-trip basis) or have free travel (by reaching a daily payment limit), they end up using buses more often. Is this an incentive for people to be lazy?</li>
	<li><strong>Do students buy discounted fares?</strong> Unfortunately, most of them don't. One respondent explained to us that this is because only the long-term travel cards are discounted, and students' perceive their travel to be highly irregular. Perhaps the financial incentives are not well placed?</li>
</ul>
Next step: will people change once the mirror of data is put up to their face?

<strong>Reference</strong>:
<a href="http://www.cs.ucl.ac.uk/staff/n.lathia/papers/lathia_ubicomp2011.pdf" target="_blank">pdf</a>] N. Lathia, L. Capra. <em>How Smart is Your Smartcard? Measuring Travel Behaviours, Perceptions, and Incentives</em>. In <a href="http://www.ubicomp.org/ubicomp2011/">13th ACM International Conference on Ubiquitous Computing</a>. Beijing, China. September 17-21, 2011