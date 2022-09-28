---
layout: post
title: "Mini hack: destroying unpopular tweets"
description: Delete your tweets!
categories: [hacking]
---

I spent a day (ish) building a small cron job that deletes some of my tweets. It's now [open source](https://github.com/nlathia/tweet-destroyer) -- this post is a run down of what I built, and how it runs on Google Cloud.

## 💡 Why delete tweets?

Well... why not?

Tweets are short pieces of text that are often intended to be read _broadly_ around the time they were written. The things I (or you) tweeted 5 years ago are probably irrelevant and uninteresting; there are a few tweets here and there that I'd like to keep, but I have mostly forgotten about things I've tweeted long ago and don't care to have them resurfaced.

I've seen that a lot of people delete their tweets now--there are paid services that now do this for you--so when I was looking for a small hack project that I could use to get back into a maker mindset, I chose this.


## 🏭  Building

At a high level, this project is a [Google Cloud Run](https://cloud.google.com/run) service which is scheduled to run with [Google Cloud Scheduler](https://cloud.google.com/scheduler). It is written in Go; I've used the [go-twitter](https://github.com/dghubble/go-twitter) library to interact with the Twitter API, and [Google Secret Manager](https://cloud.google.com/secret-manager) to store the API credentials.

To start building the service, I used a CLI tool that I made last year, called _kettle_, which is [also open source](https://github.com/nlathia/kettle-cli). This command line tool is a vague homage to different internal tools that Monzo engineers built, but tailored for serverless functions: it can create a new project from [a template](https://github.com/nlathia/kettle-templates) (`kettle create`) and can deploy that project (`kettle deploy`) to a cloud service provider.

Once I created the new project, I wrote the handler: the service trawls through some of the authenticated user's (my) twitter timeline and deletes the tweets that match a given set of rules. There's a lot of nuance in the Twitter API docs about how this actually works. You can ask for 200 tweets  with an ID less than (that is, older than) *or equal* to a specified ID, but you won't necessarily get 200 back:

> Count specifies the number of Tweets to try and retrieve, up to a maximum of
> 200 per distinct request. The value of count is best thought of as a
> limit to the number of Tweets to return because suspended or deleted content
> is removed after the count has been applied. We include retweets in the count,
> even if include_rts is not supplied.

So I'm not 100% sure that what I've written will always work (feedback on [the repository](https://github.com/nlathia/tweet-destroyer) is welcome!). But it's a hack project, so life goes on. 

In the end, the first set of rules I added are:
* Destroy any RTs (tweets I didn't author) after 30 days
* Keep my tweets if I have favourited them;
* Destroy tweets that are more than a week old with no engagement (no RTs, no favourites)
* Destroy tweets more than a month old with < 10 RTs/faves
* Destroy tweets older than 6 months with < 25 RTs/faves

These thresholds are totally arbitrary and were picked out of thin air. I originally intended to keep tweets that had been quoted or replied to, but those counts are only available with in the Premium and Enterprise tiers of the Twitter API, so they're going to go (👋).


## 😤 Clicking buttons

Turns out, even _with_ a CLI tool like _kettle_, there was still a lot of console button clicking to get this project up and running. 

I ended setting up Cloud Scheduler [manually](https://cloud.google.com/run/docs/triggering/using-scheduler). It's the first time I've used it, and it was fairly straightforward--it's just a glorified crontab.

But before that, I needed to create Twitter access/token (secrets) and save them to Google's Secret Manager. I needed to enable different APIs in the Google Cloud console. And, much to my continuing discontent, I needed to faff around with creating service accounts and IAM permissions so that _things_ were allowed to do the things I wanted them to do.


## 💰 How much does this cost?

From what I can tell, it's effectively free to run this type of job--if you're a hobbyist and running this type of thing in your personal account.

* Elevated access to the Twitter API [is free](https://developer.twitter.com/en/products/twitter-api) and gives 2M tweets/month and 3 app environments.
* Cloud Scheduler gives you [3 free jobs per month, per billing account](https://cloud.google.com/scheduler/pricing). A job is not billed for individual executions. 
* Cloud Run [is free](https://cloud.google.com/run/pricing) up to 180,000 vCPU seconds/month, 360,000 GiB-seconds per month, and 2 million requests.
* Cloud Logging [is free](https://cloud.google.com/stackdriver/pricing) up to the first 50 GiB/project ingested per month. Logs retained for the default period don't incur a storage cost.


## 🧠 The end

There's lots of mini ideas that I set aside while building this. Maybe I could have overengineered this hack project to death ([again](https://nlathia.github.io/2020/04/How-to-overengineer-a-sound-classifier.html)) and trained a model to decide whether a tweet should be kept or deleted. I could have saved/archived the tweets I was deleting somewhere before getting rid of them. 

For now, this seems to be running and deleting tweets--so if you're wondering what happened to that "🎉 congrats" reply you saw from me a while back (which nobody RT'd or favourited), now you know. It's gone. 🔪


