---
layout: post
title: Crowd Voting Application
---
*This post is about a text message-based voting system I built for my student group to use at an event. [Fork it on Github](https://github.com/philipithomas/wusauce_vote).*

Tomorrow my salsa dance team, [WUSauce](http://wusauce.wustl.edu), hosts its annual dance competition. Every year in the past, we have used paper ballots to collect votes from about 400 attendees to determine a winner.

This year, we decided to take a more efficient route by avoiding paper ballots, so I implemented a Twilio-based voting system that uses text messages:

<a href="/images/wusauce_vote_app.png"><img src="/images/wusauce_vote_app_small.png" alt="WUSauce Vote App Phone" /></a>

Results are available to the organizer through a web interface:

<a href="/images/wusauce_vote_interface.png"><img src="/images/wusauce_vote_interface.png" alt="WUSauce Voting App Interface" /></a>

I based the application on the [twilio php framework](https://github.com/TextReject/twilio-php-framework) we published at [Text Reject](http://textreject.com). It uses PHP code with a MySQL back-end, and Twilio to handle incoming and outgoing messages. I secured the production application with HTTP authentication.

The code is available as an open source project on Github [here](https://github.com/philipithomas/wusauce_vote). Setting it up is fairly straightforward with an existing Heroku account and Twilio account. The array in [choices.php](https://github.com/philipithomas/wusauce_vote/blob/master/choices.php) may be modified to change the voting options. 