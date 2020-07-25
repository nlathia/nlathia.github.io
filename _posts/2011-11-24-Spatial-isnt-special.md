---
layout: post
title: "Spatial isn't Special"
description: Originally published on urbanmining.wordpress.com
categories: [research, recsys]
---

On Monday I gave a talk at a <a href="http://www.sdimag.com/apps-inspire-and-the-new-economy-21-november.html">workshop in Edinburgh</a> hosted by the Association for Geographic Information of Scotland. The workshop was titled "Apps, <a href="http://inspire.jrc.ec.europa.eu/events/conferences/inspire_2011/?page=outline" target="_blank">INSPIRE</a>, and the New Economy" and took place at the British Geological Survey near Edinburgh University. It's <a href="http://agi.mhsoftware.com/ViewItem.html?cal_item_id=1033&amp;dtwhen=2455887" target="_blank">description</a> began like this:

> The booming market of mobile ICT devices (SmartPhones, tablets) is radically changing the geospatial scenario which is increasingly characterized by the fast update of so-called "apps".

The use of "so-called" beside quoted "apps" seemed to tell me that this workshop was not expecting a crowd of Computer Scientists! It went on to (after other details) say:

> People are getting used to retrieve the information they need when they need it according to their location.

Reflecting on recommender system research, this sentence clearly echoes the recent calls for context-aware recommender systems. However, this sentence also brought back to mind a <a href="http://urbanmining.wordpress.com/2011/06/22/whats-wrong-with-mobile-recommendations/" target="_blank">blog post</a> that I wrote a while ago about location-based services, and, moreover, how their focus on location often fails to address other important aspects (of recommendation). So I decided to give a presentation about some of the points covered in the blog post.

While I was near UCL, I captured a number of screen shots from Foursquare, apps for London's public transport, Google+, and Google Places, which were all fed into my slides:

<iframe src="//www.slideshare.net/slideshow/embed_code/key/ccFxPlHZYsutxW" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/neal.lathia/location-vs-people" title="Location vs. People" target="_blank">Location vs. People</a> </strong> from <strong><a href="https://www.slideshare.net/neal.lathia" target="_blank">Neal Lathia</a></strong> </div>

This is the first time that I've put together a presentation like this, in the sense that it was not presenting research or quantified results that I have obtained. I would consider it an implicit talk about how location is only one of many signals that represents a user's context in any personalized mobile application. The rest of the workshop covered a lot of ground: presentation topics ranged from FP7 <a href="http://cordis.europa.eu/fp7/home_en.html" target="_blank">funding</a>, the <a href="http://www.ordnancesurvey.co.uk/oswebsite/" target="_blank">ordnance survey</a>, open street <a href="http://www.openstreetmap.org/" target="_blank">map</a>, and other projects happening around Europe.

Two short thoughts in closing:

### Talking to different audiences

If I had been giving this talk to a bunch of recommender system researchers, the message may have been the opposite (location matters!); particularly since such systems have typically taken the "black-box" approach to recommendation, focusing exclusively on user preferences. In fact, some recent work that was presented at <a href="http://mobblog.cs.ucl.ac.uk/2010/10/13/rethinking-mobile-recommendations-is-it-time-to-forget-nearby-events-and-look-at-neighbourhoods/" target="_blank">ICDM 2010</a> showed just how powerful the location signal can be. On the other hand, the audience that I presented to is very location-oriented. In fact, the title of this post ("spatial isn't special") was quoted by someone at the workshop as a phrase that is appearing in their community: spatial data is just another kind of data, and should not be treated alone.

### Future of Geo

I had a particularly strong impression throughout the day (please correct me if I'm wrong) that a lot of the future planning around geographical information systems is conditioned by what _may be_ possible to build _if large tech companies don't build it first (and better). _It came up a few times; we would like to do X, but we can't because Android users prefer Google Maps; we could make Y, but iPhone users will use Apple's version. The message in my talk above was about how the focus should be on the user, rather than the maps. What do you think?
