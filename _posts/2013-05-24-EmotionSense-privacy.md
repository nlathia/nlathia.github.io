---
layout: post
title: "Emotion Sense App: Privacy Concerns"
description: Originally published on urbanmining.wordpress.com
categories: [research]
---

Recently, we launched the <a href="http://emotionsense.org/" target="_blank">Emotion Sense</a> app for Android on the <a href="https://play.google.com/store/apps/details?id=com.ubhave.emotionsense" target="_blank">Google Play Market</a>. This app combines <a href="http://en.wikipedia.org/wiki/Experience_sampling_method" target="_blank">experience sampling </a>with the passive data that modern smartphones can collect, and gives people feedback about how their reported mood compares to this data. Of course, this app was designed and built to support our research into how daily mood relates to the behavioural signals that phones can capture.

To support the launch, <a href="http://www.cam.ac.uk/research/news/mood-tracking-app-paves-way-for-pocket-therapy" target="_blank">this press release </a>was published<a href="http://www.cam.ac.uk/research/news/mood-tracking-app-paves-way-for-pocket-therapy" target="_blank">,</a> which has since been picked up by a number of newspapers and blogs (a sample of them are listed <a href="http://emotionsense.org/press.html" target="_blank">here</a>). Overall, the response has been overwhelming and we have learned a number of lessons which I should dedicate a separate blog post to.

Naturally, since this app collects data from a wide variety of sensors, there have been a number of concerns about privacy. This issue has and continues to be very important to us. However, a number of comments that have been made are misleading and so this post aims to clarify how and why we collect sensor data.

## Why do we collect sensor data? What happens to this data?

The aim of collecting sensor data is to support academic research into daily moods and smartphone sensors. We are academic researchers, not marketers: we are ethically bound and fully committed to never sell or share the data the app collects. We are not interested in advertising or making money off your data: we are interested in progressing the state-of-the-art in Computer Science (sensing and data mining) and Psychology (studying daily life). If any of us leave the University, to move on to other projects, we will leave the data behind. We will also never make the data available to anyone, except the person who generated it. If you want your data, you can simply get in touch.

Our research is not about prying into individual's lives. We are looking for broad patterns, which emerge from many people doing the same thing (e.g., using an app). We really have no interest in looking at anything other than aggregate patterns in the data.

## How is the data anonymised?

The app does a fair bit of data collection on your phone, but then anonymises it: we do not receive your raw data. In particular:
* The app does not send us conversations,or any audio recordings at all. All it does is measure the ambient volume, which is a number (e.g., "23"). We do not and cannot track the web sites you visit, your eye movement, or how you touch your phone screen (in fact, other researchers have shown that this is impossible on a <a href="http://www.youtube.com/watch?v=TKcC3Q9Ss6o" target="_blank">number of Android devices</a>!).
* The app does not record any text message content or clear text phone numbers. In fact, it uses a one way <a href="http://en.wikipedia.org/wiki/Hash_function" target="_blank">hash function</a> to convert a phone number into a indecipherable string. So, for example, we will see that a phone texted another phone, identified as "abdjasdfkjqwercsdsdsaqt2" and sent 3 words.

## How is this research funded?

We have not paid anyone to write/blog about our work, and our project has no commercial partners. Our work is funded by the Engineering and Physical Sciences Research Council: details of the project are available <a href="http://gow.epsrc.ac.uk/NGBOViewGrant.aspx?GrantRef=EP/I032673/1" target="_blank">here</a>.

We are aware that people may still have some questions about how the app works. If you or any of your readers has any questions, please feel free to contact me: neal.lathia@cl.cam.ac.uk

Or visit our <a href="http://emotionsense.org/faqs.html" target="_blank">FAQs page</a>.

## Update: Potential Reasons for this Confusion

As pointed out to me, some of the confusion about what we are doing with data may be due to <a href="http://www.cl.cam.ac.uk/~cm542/papers/Ubicomp10.pdf" target="_blank">this earlier research paper</a> that was published in 2010 and used the same Emotion Sense name. I would like to point out that the app used in this paper is very different from the app that we released to the general public.

The publicly available app **does not** perform any speaker recognition or emotion detection. This is for a number of reasons:
* **Privacy.** Since an audio recording should have informed consent, and not everyone around your phone may have given it, we chose to not store an audio that is recorded beyond (as above) the ambient volume.
* **Technical Challenges.** While audio processing research is progressing, an earlier trial of the techniques we used in previous research were inconclusive and overly cumbersome: the sounds that people are surrounded with when their phones are in their bags, pockets, etc. go well beyond the controlled trial that was done in the lab.
* **Moving Beyond the Microphone.** There is, naturally, more to a smartphone than its microphone. The design of the publicly available app therefore seeks to learn about daily life using a more holistic approach (i.e., combining the data from different sensors).
