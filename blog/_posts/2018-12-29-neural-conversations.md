---
layout: post
title:  "Neural Approaches to Conversational AI: Question Answering, Task-Oriented Dialogues and Social Chatbots"
author: Gao, Galley, Li
tags: [paper]
categories: [Notes on Research Papers]
---

Available: [https://arxiv.org/pdf/1809.08267.pdf](https://arxiv.org/pdf/1809.08267.pdf)

## Chapter 1. Introduction

Intelligent dialogue systems are on the rise thanks to breakthroughs in deep and reinforcement learning. The research field is growing too, attracting folk from the NLP, IR, and ML communities. A number of tutorials and surveys have been published - this chapter is another survey, based on tutorials given at SIGIR and ACL 2018 - that hopes to provide a unified view of conversational / dialog systems.

The kinds of problems that dialog systems are expected to solve include:

* **Question answering**: providing a concise, direct answer to user queries based on rich knowledge drawn from various data sources.
* **Task completion**: accomplishing a task for the user (e.g., restaurant reservation, business trip planning).
* **Social chat**: conversing seamlessly with the user and providing useful recommendations.

Bots can be grouped into two categories: "task oriented" and "chitchat." All of the personal assistants on the market today (e.g., Alexa) are task oriented and handle simple, one off tasks (e.g., reporting the weather). They are typically composed of four modules: (1) Natural Language Understanding, (2) state tracking, (3) dialog policy, (4) Natural Language Generation -- although there is now a trend to develop all four of these together using a neural network. Most of these will have access to external databases that supporting completing the task.

An example of a chat-oriented bot is XiaoIce - there's an overview of it in the recent [Import AI newsletter](https://jack-clark.net/2018/12/25/import-ai-126-what-makes-microsofts-biggest-chatbot-work-europe-tries-to-craft-ai-ethics-and-why-you-should-take-ai-risk-seriously/). Their primary goal is often to be "companions to humans with an emotional connection." 

The unified view casts dialog as an *optimal (hierarchical) decision making* process. The top level is about picking the right agent (e.g., question answering vs. meeting scheduling), the lower level is about picking the right action. These can be thought of as options over a Markov Decision Process, which fits well with reinforcement learning.

A common metric to use as a reward function is CPS: **Conversation-turns Per Session**. There are two views on this metric: it sometimes needs to be minimised (complete a task quickly) and other times needs to be maximised (engage in long/meaningful conversations). The can be combined by reasoning over multiple sessions: being able to complete a task quickly (small short-term CPS) means that users will find the dialog system useful and will use it often (large long-term CPS).

Neural-based NLP tasks are usually performed in three steps: (1) encoding user input (words) into vectors, (2) reasoning in the vector space to generate a response, (3) decoding the response into a symbolic space (back to words). End-to-end training of neural nets results in a tighter coupling between the architecture and the application -- the focus shifts away from having the right components for language processing (e.g., parsing, context reasoning, etc.) towards having the right architecture.

## Chapter 2. Machine Learning Background

This chapter is an overview of ML. I'm only going to write notes about bits that are specific to conversational systems.

Widely used neural network layers for text classification:

* Embedding layers: mapping each word to an m-dimensional vector.
* Fully connected layers: performing linear projections
* Convolutional-pooling layers: forms a local feature vector of a word and its adjacent words (within a fixed sized window).
* Recurrent layers: map the text to a dense/low dimensional vector by sequentially and recurrently processing each word.

Two examples: [Deep Structured Semantic Model](https://www.microsoft.com/en-us/research/project/dssm/) and [Seq2Seq](https://google.github.io/seq2seq/).


## Chapter 3. Question Answering and Machine Reading Comprehension

Question Answering (QA) allows a user to query a large scale knowledge base/document collection in natural language. They differ from search engines in that they aim to provide a concise and direct answer rather than a ranked list of results. QA is split into single-turn and multi-turn, with the latter being an emerging research topic.

Knowledge base (KB) question answering has been developed based on symbolic approaches -- which has been hard to scale. KBs are sometimes known as knowledge graphs - entities are nodes and relations are directed edges between them. Finding an answer to a question is based on semantic parsing: mapping a question to a "meaningful" representation, finding the paths in the graph that match the query, and then retrieving the nodes. This approach has two challenges:
* Paraphrasing: there are many ways to ask the same question. Embeddings have been a useful way to tackle this.
* Search complexity: number of candidate paths grows exponentially with the path length.

Embeddings map entities and relations to continuous vectors in a (neural) space: this space can be viewed as a hidden semantic space where various expressions with the same semantic meaning map to the same vector. There are various ways (e.g., ReasoNet using DL and DeepPath using RL) to perform multi-step knowledge based reasoning using these vectors. 

For multi-turn QA, users need to interactively compose (complex) queries, where the agent can ask clarifying questions. The Entropy Minimization Dialogue Management strategy picks the next question to ask based on the attribute that has the most entry in the remaining KB entries.

Machine Reading Comprehension is the task of answering questions given a set of text passages. Answers are defined as a span of text in (one of the) passage(s). There are many datasets (e.g., SQuAD) that are fueling research in this area. As with approaches above, this is usually done in 3 steps: encoding, reasoning, and decoding.
* Encoding: Popular pre-trained embeddings include word2vec and GloVe, and can be enhanced with part of speech tags. Contextual embeddings (e.g., ELMo and BERT) uses contextual cues from surrounding words to refine the embeddings.
* Reasoning: can be done in a single-step (match the question and document only once) or multi-step.

Many of these systems are developed as single-turn. To make this conversational, the system also needs to include (encode) the conversation history.




