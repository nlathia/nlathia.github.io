---
layout: post
title: "Open Problems in Shared Bicycle Research"
description: Originally published on urbanmining.wordpress.com
categories: [research]
---

I recently attended and presented at a workshop on shared bicycle systems in Paris, France. The workshop, called "<em>Spatio-temporal Data Mining for a Better Understanding of People's Mobility: The Bicycle Sharing System (BSS) Case Study</em>" was organised by Latifa Oukhellou from IFSTTAR; the program and slides are online <a href="http://www.ifsttar.fr/recherches/geri/animatic/workshop-2012/" target="_blank">here</a> (and the presentation that I gave on my <a href="http://www.cl.cam.ac.uk/~nkl25/publications/papers/lathia_transport_research_c.pdf" target="_blank">recent paper</a> is embedded below).

I personally think that it was an excellent opportunity to collect a variety of people who have been working with data from shared bicycle systems; particularly since the work spanning this 'nascent' field is from people with very diverse academic backgrounds. The day uncovered surprising similarities in the techniques that people are using to analyse a variety of city's data (e.g., clustering stations), and, more broadly, what the few (but growing) researchers in this field have been trying to solve.

The day also really served to expose a number of key problems:

## Data Acquisition

There is a blatant tension between researchers who have and want to continue studying these systems and those practitioners who run shared bicycle system web sites. A vast majority of researchers in the group have obtained their data by regularly crawling a shared bicycle map, like <a href="https://web.barclayscyclehire.tfl.gov.uk/maps" target="_blank">this one of London</a>. This has allowed researchers to collection time-varying station capacity data, and is useful for training algorithms that seek to predict how many bikes a station will have. However, this is clearly not an ideal way to collect data, and I hope to see a closer collaboration between transport operators and researchers in this domain in the future.

## Data Quality

The data that is collected by scraping web sites is prone to inaccuracies and noise, and this can lead to errors in our analysis. For example, <a href="http://bikes.oobrien.com/london/" target="_blank">Ollie</a> (who has made all the great online maps of shared bike systems) pointed out that one of the differences that I uncovered in my recent work was not due to a change in activity, but in the fact that the station that I thought had changed patterns had, instead, simply been moved closer to a train station. While, in hindsight, I don't think this completely deconstructs the work I did (!) I wonder how much of the broader research is somewhat affected by similar hidden changes (or, at least, changes that a web scraper would not be seeking).

## Data Granularity

More importantly, web-scraped data does not capture important features of the system, such as origin-destination pairs or the actual habits of the systems' users. As researchers, we know that the value of data is often proportional to its granularity. For example, all of the recent work that I have done using Oyster card data would not have been possible if all I had was station gate counts, which is the rough equivalent of the data that most shared bicycle researchers have. How are people responding to incentives? What is the variety of behaviours that the system users are exhibiting? All these questions are currently beyond our (data's) reach.

## Limits of the Data

A very important point was raised during the day: <em>any</em> data that the transport authority holds will inherently only capture the "satisfied" part of the travel demand. All public transport operators do not currently have means of gauging how many passengers they have failed to transport; whether that be because the person has made the (healthy) choice to walk, or (in the shared bicycle case) that person has found an empty station when they sought a bicycle, or a station where all the bike's tires have been punctured.

## Motivation for Mining Shared Bike Data

As researchers, I don't think that we have fully uncovered the entire family of problems that data from shared bicycle systems can address; I felt that some propositions were lacking in a grounded motivation. There are a wide range of problems that could be addressed, if the right data were at hand. For example, can the data be used to discover bicycles that are broken? Can real-time data mining guide a load balancing truck to best suit current and predicted travel demand? This is where perhaps a closer relationship with transport operators may again be helpful.

Overall, I think it was a great workshop, and I encourage you to look at the presentations that are <a href="http://www.ifsttar.fr/recherches/geri/animatic/workshop-2012/" target="_blank">online</a>. If you have an interest in this area, I would also encourage you to join the <a href="http://groups.google.com/group/bikesharingsystems" target="_blank">Google Group </a>that I set up for researchers in this domain to share their findings.

<iframe src="//www.slideshare.net/slideshow/embed_code/key/5U5CHv61qoweGH" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/neal.lathia/london-shared-bicycles-measuring-intervention-impact-15534980" title="London Shared Bicycles: Measuring Intervention Impact" target="_blank">London Shared Bicycles: Measuring Intervention Impact</a> </strong> from <strong><a href="https://www.slideshare.net/neal.lathia" target="_blank">Neal Lathia</a></strong> </div>
