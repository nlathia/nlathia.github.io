---
layout: post
title: "Intelligent Techniques for Web Personalization"
description: Originally published on mobblog.cs.ucl.ac.uk
categories: [research]
---

Yesterday, I attended the 7th IJCAI [Workshop](http://www.dcs.warwick.ac.uk/~ssanand/itwp09/) on Intelligent Techniques for Web Personalization & Recommender Systems, in Pasadena. The [IJCAI-2009](http://ijcai-09.org/index.html) technical program will start on Tuesday. Here's a summary of the sessions during the day:

<strong>1. Modeling and Personalization Strategies</strong>
* <a href="http://www.cs.cmu.edu/~srosenth/">Stephanie Rosenthal</a> (Carnegie Mellon) presented her work on online selection of recommender algorithms; she proposed an online switching algorithm (that moved between global/domain-specific recommenders) based on temporal performance. Interestingly, she used 3 datasets, including the recently released <a href="http://mobblog.cs.ucl.ac.uk/2009/05/05/yahoo-datasets-webscope/">Yahoo! Webscope</a> data. Her work is related to the paper <a href="http://mobblog.cs.ucl.ac.uk/2009/04/28/temporal-collaborative-filtering/">I am presenting</a> next week at SIGIR.
* <a href="http://www.csse.monash.edu.au/~fabianb/">Fabian Bonher</a>t (Monash U, Australia) presented a personalised technology for guiding users through a museum. Based on manually collected data, he introduced a model (combining spatial information and item-similarity information) for predicting how users move in this context.
* <a href="http://www.cs.toronto.edu/~paolo/">Paolo Viappiani</a> (U of Toronto) presented a model to provide a set of recommendations based on <a href="http://en.wikipedia.org/wiki/Regret_(decision_theory)">regret</a>; the purpose being to maximise the utility of a list of recommendations (for example, a list of apartments to look at).

<strong>2. Enabling Technologies</strong>

* <a href="http://vega.icu.ac.kr/~demon/">Jinhyuk Choi</a> (KAIST, S. Korea) discussed his work on the analysis of contextual web usage patterns. In trying to answer the question "what contextual factors exert influence on the usage logs?&#8221; he highlighted the difference between navigational and content pages, casual tasks and careful searching, and the (explictly requested) credibility that users attributed to different pages.
* <a href="http://4c.ucc.ie/~thadzic/">Tarik Hadzic</a> (UC Cork, Ireland) presented his work on representing catalogues as multi-valued decision diagrams, including scalable techniques for merging nodes in the graph in order to reduce their size.
* Eduardo Eisman (U of Granada, Spain) was exploring a widespread problem on the Internet: information is unstructured and diverse without homogeneous structure. The problem is compounded by the fact that search engines return too many results. His proposed and evaluated a context sensitive, multi-lingual, real-time virtual assistant to help users search for information on a website.

<strong>3. Invited Talk</strong>

The invited talk was given by <a href="http://twitter.com/barrysmyth">Barry Smyth</a> (director of the <a href="http://www.csi.ucd.ie/users/barry-smyth">CLARITY centre</a> in Dublin). His talk was about "the web's killer app" search. Barry is a great speaker - his talk was roughly split into three parts:

* <strong>The State of Search</strong>. Barry discussed interesting facets of web search. For example, 52% of searches are 'failures,' where users need to shuffle/reword their query (try googling for "umap" the conference on user modeling adaptation and personalization - and see where the conference is ranked).  He also reported on studies of people's searching habits - while 57% of searches are for <em>discovery</em>, the remaining 43% are for <em>recovery</em> - regaining access to previously visited resources.
* <strong>Context in Search</strong>. He then outlined the growing interesting in applying context to search. Current work is roughly categorised into augment search with user profiles (e.g. <a href="http://people.csail.mit.edu/teevan/work/publications/papers/sigir05.pdf">this paper</a>), document context (e.g. the targetted ads from google adsense), and task context (e.g. searching for 'pizza' on the iPhone and finding pizza restaurants around you).
* <strong>What is Missing from Search Context? </strong>Barry then discussed his work on the one aspect of search that isn't represented in the above - <em>social context - </em>or what people around us are searching for. In fact, 2/3rds of what we search for is likely to have already been found by a friend; the aim of social search is to harvest this knowledge and use it to improve our results. He introduced <a href="http://heystaks.com/">HeyStaks</a>, a browser plugin that does just this - allowing users to categorize and share their searches and search results. He then explored a wide range of aspects of this plugin, ranging from the social graph of collaboration, to how the plugin builds a meta-search engine (blending results from bing, google, etc), and the inbuilt reputation system to counteract spam. He ended on an interesting note - that there is much more to improving user experience than tweaking an algorithm (a comment on the Netflix prize?)

<strong>4. Recommender Algorithms + Hybrid Recommenders</strong>

* <a href="http://www.cs.uni-dortmund.de/nps/de/Home/Personen/J/Jannach__Dietmar.html">Dietmar Jannach</a> (Dortmund U, Germany) presented a very interesting user study on the business end of a recommender system - how much does introducing a recommender system to a mobile gaming shop shift user shopping behaviour? The work involved extending a game selling app with a variety of recommender systems (popularity, collaborative filtering, etc), and measuring how it affected sales. 150,000 users participated in the study (wow!). They measured between 3.2-3.6% increases in sales - the problem this highlights is <em>when</em> to apply <em>what</em> recommender algorithm.
* <a href="http://maya.cs.depaul.edu/~mobasher/">Bamshad Mobasher</a> (DePaul University, Chicago) discussed some work of his students on adapting kNN for tag recommendations in folksonomies. Suggesting tags for users to apply to content has the interesting effect of reducing the effort and errors in tagging, and encouraging tags to be reused. The algorithm he presented outperforms the FolkRank algorithm!
* My <a href="http://www.slideshare.net/neal.lathia/ijcai-workshop-presentation">talk</a> followed, based on a follow up to the <a href="http://technocalifornia.blogspot.com/2009/05/wisdom-of-few.html">SIGIR '09 paper</a> that reports on the work I participated in during my internship at Telefonica. The last talk was cancelled.

<strong>5. Wrap-Up/Discussion</strong>

We finished the workshop with a discussion on the themes that emerged during the day. By this point, my laptop was dead and so I did not take notes (if you did, and would like to post on this blog about it, then please get in touch). However, we discussed evaluation metrics, user studies, context, ...

Overall, the workshop was very interesting and a big thanks is due to the organisers: <a href="http://www2.warwick.ac.uk/fac/sci/dcs/people/Sarabjot_Anand/">Sarabjot Singh Anand</a> (Warwick University), <a href="http://maya.cs.depaul.edu/%7Emobasher/">Bamshad Mobasher</a> (DePaul University), <a href="http://www.ics.uci.edu/%7Ekobsa/">Alfred Kobsa</a> (University of California Irvine) and <a href="http://ls13-www.cs.uni-dortmund.de/dietmar/index.html">Dietmar Jannach</a> (Technical University of Dortmund).

