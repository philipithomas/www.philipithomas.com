---
category: "essay"
layout: "post"
description: "Explaining the MapReduce algorithm in an on-technical way."
title: "A Simplified Example of MapReduce"
date: "2014-10-22"
---

While mentoring through [Hackbright](http://hackbrightacademy.com) I was asked to explain the [MapReduce algorithm](https://en.wikipedia.org/wiki/MapReduce) to students with little technical background, and I came up with an interesting example to illustrate how it works.

## Example

You want to count how many spades are in a deck of cards. The naive way to do this would be to go through every card and count how many are spades. 

<img src="/images/cards.jpg" alt="Playing cards"/>

The MapReduce method would be:

1. Divide the deck of cards among all players at the table.
2. Tell every player to count how many of the cards they hold are spades, and report that number back to you.
3. You add up the sums from the players to arrive at the same conclusion.

## Background

Google published the [MapReduce algorithm](http://research.google.com/archive/mapreduce.html) for analyzing massive amounts of data in 2004. Whenever you hear the phrase "big data," it refers to problems that are too large for a single machine to store or analyze efficiently. MapReduce solves most of the analysis problems related to big data by spreading calculations over clusters of computers. [Hadoop](https://en.wikipedia.org/wiki/Apache_Hadoop) provides the most popular open-source way of managing large data and using MapReduce algorithms. Today MapReduce is mainstream.

So - in general, when you hear "big data" that probably means that Hadoop is being used to store the data, which probably means that MapReduce is how the data is being extracted and queried.

## Breaking it down

MapReduce combines two classic functions:

* **Mapping** applies an operation to each target in a set. So - if you want to double every cell in an spreadsheet, then applying that function to each cell individually would be mapping.
* **Reducing** recurses through a set to return an aggregated result. So, printing the sum of a spreadsheet column is reducing.


## Example Revisited

Revisiting our original example of spreading out cards, we have a basic technique for MapReduce analysis of data. Fair warning: it is not a rigorous example. In our example, the people represent computers, and because they are working together they are a **cluster**. In most real-world applications, we assume that the data is already on every computer - so handing out the cards is not a MapReduce step. (*In fact, how files are stored among a cluster of computers is the real core of Hadoop.*)

By splitting up the deck of cards among multiple players and asking them to each count, you execute calculations in **parallel** because every player is counting at the same time. This also makes the job **distributed** because multiple different people are working on the same problem without needing to know what their neighbors are doing.

By telling each person to count, you are **mapping** a job to go through every card. Instead of having them hand you back only spade cards, you have them **reduce** what you are looking for down to a number.

One other interesting case here is how evenly the cards are distributed. MapReduce assumes that the data is **shuffled** - if one person ends up with all of the spade cards, they might be a lot slower at counting through their cards than others.

With enough people, it would be fairly simple to ask more interesting questions - like "what is the average blackjack value of all of the cards in a deck." You could do this by combining queries "what is the *sum* of all of the cards' values" and "*count* how many cards we have." Divide the sum number by the count number and you have the average poker value of the cards.

## Conclusion

The mechanics of the MapReduce algorithm are far more intricate, but the idea remains the same - analyzing large amounts of data by spreading out the calculations. From Facebook to NASA to startups, MapReduce is now the mainstream way to analyze information at the scale of the Internet. Interestingly, MapReduce tends to slow down after about 10 petabytes of data, so Google reported this year at their IO conference that [they have outgrown MapReduce](http://java.dzone.com/articles/google-io-dumping-mapreduce).
