---
layout: post
title: "Evaluating Large Language Models Trained on Code (paper review)"
description: "Notes from reading the paper behind Github Copilot"
categories: [paper]
---

I recently read [Evaluating Large Language Models Trained on Code](https://arxiv.org/pdf/2107.03374.pdf), a paper that describes the research that led to Open AI's [Codex](https://openai.com/blog/openai-codex/), which powers [Github Copilot](https://github.com/features/copilot).

 Codex's overarching goal is to be a system that can generate code from a user's prompt. To get there, the paper covers a lot of the classical things that go into the end-to-end process of building an AI-powered system--ranging from collecting a dataset through to designing ways to understand how well the model performs.

This post is a collection of the notes I took while reading it, with a few reflections (💭) interspersed throughout.

## 📑 The training dataset is from Github

The dataset was sourced in May 2020. In their own words, it came from:

> ... 54 million public software repositories hosted on GitHub, containing 179 GB of unique Python files under 1 MB.

Open source code is a natural starting point to train this type of model, but the data is not _perfect_; nobody would intuitively assume that all Python code on Github is top-notch or free of malware (the paper points to [other research](https://www.usenix.org/conference/raid2020/presentation/omar) that identifies malware using binary classification).

The dataset was filtered using an interesting set of heuristics. Files that had a long average or maximum line length were thrown out, as were files with a "small percentage" of alphanumeric characters. Finally, files "which were likely auto-generated" were discarded too, although they don't describe how they determine this. The filtering step removed 20 GB of data from the initial 179 GB.

💭 There is no mention of whether they considered additional signals that could be sourced from Github. For example, Github has social network-like signals (users have followers, repositories have dependency graphs) and engagement-like signals (repositories have contributors, stars, watchers, and forks). Outside of Github, there are datasets that capture usage (installations) of open-source Python libraries. And finally, the code itself could be inspected further: there are static analysis tools that can be used to asses indicators of code quality, scan for vulnerabilities, or perhaps even detect whether code is Python 2 or Python 3. Some of these additional signals _might_ be useful to further assess whether code is "good enough" to be in- or excluded, but I also imagine that being very harsh here could severely limit the size of the data and discard a number of common functions that everyone writes--which is what models like Codex implicitly aim to do.  

## 🤖 Codex is a fine tuned GPT model

This paper is not about designing neural nets that have a specific, novel design for the problem at hand:

> We fine-tune GPT models containing up to 12B parameters on code to produce Codex

There's an interesting angle to this that gets mentioned: since the problem is that of generating code from _free text_ prompts, they hypothesized that starting from GPT-3 (which has already been trained on free text) would work better. It did not, "possibly because the fine-tuning dataset is so large." But those models did converge more quickly and so they still use them.

## 📈 Understanding performance is the trickiest part

Understanding whether this type of model works well is the heart of this paper and surfaces a lot of interesting questions and decisions that had to be made along the way. 

In a traditional text generation setting, models are evaluated with metrics like [BLEU](https://en.wikipedia.org/wiki/BLEU) that originate from the machine translation realm. The intuition behind this type of metric is that it's not easy to evaluate whether a piece of generated text is "good" so the metric measures how _similar_ the generated text is to one or more human-written candidates.

Code is similar to free-text generation, in that there are many different ways of implementing similar actions (especially in Python!). However, code differs in that you can assess whether it is _functionally correct_ by running unit tests against it. Unit tests assert that the code (a) can run, and (b) produces the desired output in a given case. This gives the authors a more deterministic approach to evaluate Codex's output: given a prompt describing a function, and some (hidden) unit tests, can the model produce code that makes all of the unit tests pass?

Since these models can also create more than one sample from a prompt, the authors parameterise the pass rate metric as pass@k. This means that when k=100, they have asked the model to produce 100 samples for a prompt and then measured whether the unit tests pass with _any_ of the samples.

The authors created and [open-sourced](https://github.com/openai/human-eval) a set of 164 problems (with an average of 7.7 unit tests each) themselves. They opted to take this approach instead of using problem sets from coding challenge websites because their training set, Github, is known to contain solutions to many popular programming problems. Notably, the authors acknowledge that this method requires executing generated (untrusted) code; a model that is really misbehaving could do bad things (e.g., `os.remove()`, `subprocess.run()`), and so they run everything in a sandboxed environment. 

💭 The main trade-off that comes with a purpose-built evaluation dataset is that it is small and relies on bug-free and high coverage unit tests. Auto-generated code may have a high pass rate on a problem and still be wrong if the unit tests are missing a critical case. By focusing on a binary outcome--whether the code passes unit tests--this approach doesn't measure several other qualities of the output that are often valued by people writing code, like legibility (which would be much harder to measure!) or efficiency (speed/memory measurements). I didn't catch any mention of whether the authors ever detected a model generating malicious code, but they do point it out as a possibility several times.

For a product like Github Copilot, the pass@k metric is a bit distant from the end-user experience, where users will get _one_ suggestion and unit tests are unlikely to have been written ahead of time. This introduces the meta problem of picking the 'best' generated sample from several runs. The authors touch on this, adopting things like the sample with the highest mean token log probability.

## 👀 Further fine-tuning and docstring generation experiments

While Codex is just trained with the Github data, a second set of models are further trained with data

> from competitive programming websites and from repositories with continuous integration [...] We call the supervised fine-tuned models Codex-S, and show that they produce consistent gains across model size.

The former adds an extra 10,000 problems, the latter (deriving unit tests by profiling integration tests in open source repositories) adds a an additional 40,000 problems. Notably, the authors used the base Codex model to vett the problems that were collected from these two new sources:

> we use Codex-12B to generate 100 samples per curated problem. If no samples pass the unit tests, we consider the task to be either ambiguous or too difficult, and filter it out.

The fine-tuned Codex-S models beat Codex

> by an average margin of 6.5 percentage points on pass@1 and by a larger average margin of 15.1 percentage points on pass@100

The authors also flip the problem on its head: using code to generate a docstring that describes what a function does (Codex-D). This lands them back into the problem of evaluating the quality of the output, since docstrings cannot be evaluated as deterministically as code. They revert to a manual approach:

> we grade sample docstrings by hand, considering a docstring correct if it uniquely and accurately specifies the code body. Due to the time consuming nature of this process, we only grade 10 samples per problem, for a total of 1640 problems

## 🚨 Limitations, impact, and analysis

The final sections of the paper extensively discuss some of Codex's limitations and impact.

Here are some of the statements that jumped out while I was reading through:
* Codex can recommend syntactically incorrect or undefined code, and can invoke functions, variables, and attributes that are undefined or outside the scope of the codebase;
* Codex may suggest solutions that superficially appear correct but do not actually perform the task the user intended;
* Codex can be prompted in ways that generate racist and otherwise harmful outputs as code comments;
* Codex can generate code with structure that reflects stereotypes about gender, race, emotion, class, the structure of names, and other characteristics;
* Codex imports packages at different rates, which could advantage some package authors over others;
* Codex can produce vulnerable or misaligned code

💭 Unpacking all of this goes beyond the time I'm going to dedicate to this blog post; there are _a lot_ of claims with important repercussions. There seem to be some things that could be dealt with in post-processing steps (e.g. discarding suggestions that are syntactically incorrect or detecting suggestions with vulnerable code), while others could require revisiting the training set altogether (e.g., filtering out racist comments!). The paper states that "qualified operators should review [Codex's] generations before executing or trusting them" and "we consider any sensitive data present in the training data to have already been compromised" which reads a bit like a [CYA](https://en.wikipedia.org/wiki/Cover_your_ass).

## ⏩ Conclusions

There are a lot of fascinating questions, decisions, and methods in this paper--the crux of it is (as per the paper's title) being about how to measure whether code generation works. Each of the paper's sections presents several ideas and directions for how these types of models could be improved and point to a ton of related work in this field.

Since this paper, OpenAI's [API](https://openai.com/blog/openai-codex/), and Github's [Copilot](https://github.com/features/copilot) have been released, I've heard Engineers speak very highly of code suggestions, and [follow up studies](https://github.blog/2022-09-07-research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/) show increases in perceived productivity and happiness. Other companies have trained and released their own models--I'm sure that there is more to come in this space. Most interestingly, lurking in the background, is the discussion of whether this type of system [does](https://githubcopilotinvestigation.com/) or [does not](https://felixreda.eu/2021/07/github-copilot-is-not-infringing-your-copyright) infringe on open source developer's copyright--it will be interesting to see how this will play out.

