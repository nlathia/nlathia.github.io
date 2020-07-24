---
layout: post
title: "On Data Mining Competitions"
description: Originally published on urbanmining.wordpress.com
categories: [research, data-science]
---

The data mining community has a soft spot for competitions.

At the <a href="http://www.kdd.org/kdd2011/" target="_blank">ACM KDD 2011</a> conference (San Diego, August 21-24 2011), the results of a <a href="http://www.kdd.org/kdd2011/kddcup.shtml" target="_blank">competition</a> on predicting music ratings was announced and a <a href="http://www.kdd.org/kdd2011/panels.shtml" target="_blank">panel</a> called "<strong>Lessons Learned from Contests in Data Mining</strong>" was held. The panel featured familiar faces in the data mining competition world- including <a href="https://twitter.com/#!/jeremyphoward" target="_blank">Jeremy</a> from <a href="http://www.kaggle.com/" target="_blank">Kaggle</a>, who I met at <a href="http://datamining.it.uts.edu.au/icdm10/" target="_blank">ICDM 2010</a> in Sydney. If you haven't heard of Kaggle, they are an exciting new start-up which offers a platform to easily run data mining competitions, and already have a hot list of ongoing/past competitions. Organising a panel is no easy task; I have seen some that are, essentially, a set of advertisements for each panelist (or their employer). This one worked out quite well: so well, in fact, that I don't really want to write about the panel itself, but some of the thoughts I came away with about data competitions after it.

Competitions fascinate me. It looks like they are a great untapped resource of human potential. They are exciting, not only in and of themselves, but for how people react to them and behave while participating in them. But what is their place in the grander scheme of things? Here are some points for each side of the table:

<strong>Competitions: a key piece of the future of data mining</strong>

Competitions are open; they are democratic. They allow a PhD student in glaciology <a href="http://www.whitehouse.gov/blog/2011/06/27/competition-shines-light-dark-matter" target="_blank">outperform state-of-the-art </a>algorithms for detecting dark matter. The wisdom of the crowds only appears when the crowd is diversified- competitions are the portal to diversity. The winner may get the money, but everybody learns a lot about data mining, prediction, and algorithms. Not to mention that the data set attracts remarkable attention to the field that it comes from (says the guy who started reading about recommender systems when the Netflix prize was first announced).

Competitions allow you to flex your algorithmic muscle<em> in front of people who care</em>. Honestly, I wouldn't mind never having to sit through another paper's presentation that concludes with "so we got a 5.7% improvement over the baseline." Put it in a competition! Show that your 5.7% is worthwhile! I also remember a workshop <a href="http://staff.science.uva.nl/%7Ekamps/ireval/papers/paper_2.pdf">paper</a> (Future of IR Evaluation @ SIGIR 2009) that showed that this kind of research has actually led to little to no improvements over time (since researchers seem to simply pick a baseline that suits their needs). Competitions mean a quicker turn around time. They get rid of (the flawed) peer review system: everybody has the same data, the same benchmark, the same metric of progress, the one leader board. The state-of-the-art doesn't inch forward over the course of 3 to 6 month periods; it moves forward in a matter of days.

The benefit to science extends beyond the aspect of quick iteration and performance improvement. Competitions inherently separate problems with an engineering core (build the best bridge) from those that are fundamental science (tell me why the bridge stands). I'm looking forward to the day that scientists write papers about <strong>why</strong> their classifier outperforms the state of the art, rather than to tell me <strong>that </strong>their classifier does so.

<strong>Competitions: overlooking what is really important in data mining</strong>

Perhaps the biggest (unwilling) criticism of data mining competitions came from Peter Norvig's keynote at the conference. While he talked about big data research at Google, I remember his saying something along the lines of "once you have enough data... you are just counting." Improved statistical methods do not matter as soon as data is abundant enough; in fact, algorithms that seem poor with small data sets often outperform the "better" ones when you feed in more data. How does this hurt competitions? Well, for now, the data sets that these competitions release are <em>small</em> enough to allow people to participate without owning a warehouse of servers. Is all that effort dedicated to designing better algorithms put to good use then?

Competitions have also recently been their own worst enemy. The outcome of each competition seems to be the same: we won with an <em>ensemble of hundreds of predictors</em>. The winners are rewarded for being members of huge teams that can build a massive blender and spit out a delicious smoothie of predictions. The most interesting insights about the data itself do not seem to be secret keys to victory.

The KDD Cup this year was also a great example of a hotly contested criticism of competitions: due to privacy concerns (perhaps relating to the history of the forgone Netflix Prize Part II?), the actual artists in the data set were not identified. They were just numerical identifiers. What is the point of designing an algorithm if you don't know what the data means?

<strong>Looking back</strong>

By looking over my ramblings thus far, it seems that my biggest worry about competitions is that they do not reward insight or understanding - yet. The nature of a competition (particularly those that do not allow researchers to walk away with the data) will forbid researchers from asking new questions, that differ from the competition's goal. They are difficult to design and conduct- who knows if the metric is even the right one, or the target is appropriate?

Some say that, with data, "<a href="http://www3.cfo.com/article/2011/8/analytics_that-new-big-data-magic" target="_blank">you may be spot on about a problem</a>, but the solution doesn't appear magically out of the data." I see where this was going, but am not yet convinced; the (harder?) challenge of identifying the problem, finding what data should be used to solve it, and how the solution should be measured, is not solved.

There is a great saying that I've heard a few times from Italian friends (of course, relating to football/soccer) that is very appropriate here: "<strong>in football, it's not the team that plays better than wins, it's the team that scores the most goals</strong>." Is the future of data mining, and more broadly, <em>data-science</em>, going to be all about scoring an RMSE-goal, or is there a slice of the pie that competitions do not cover?