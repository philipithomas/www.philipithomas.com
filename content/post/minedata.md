---
category: "project"
layout: "post"
description: "Analyzing mining facility information to predict future accidents."
title: "MineData.org Hackathon Project"
date: "2014-11-30"
---
<div class="alert alert-info">
    <a href="http://minedata.org">MineData.org</a> is temporarily offline. We made some questionable hackathon decisions - like loading data sets into memory - that require too large of a server to maintain in perpetuity. The site will be back online when we throw the results into a database.
</div>

I met the team from the charity [Bayes Impact](http://bayesimpact.org) via an introduction by an [OpenLate](http://meetup.com/openlate/) community member. Their goal of bringing using data for social good resonated with me. We ended up hosting and sponsoring their inaugural hackathon at the OpenDNS offices, where 125 data experts worked on projects ranging from quantifying human trafficking patterns to predicting prescription drug interactions in a 24-hour period.

<a href="/images/bayes-full.jpg"><img src="/images/bayes.jpg" alt="Bayes Impact 2014 Hackathon at OpenDNS"/></a>

Three of us from OpenDNS were joined by a data scientist from Quora to compete in the event. We chose to study a data set provided by the Department of Labor that included information about mine facilities, inspections, and accidents. We developed an algorithm to identify mines that are likely to have an accident. The actionable insight from this project is better targeting of future random safety inspections. We published the project and our findings at [MineData.org](http://www.minedata.org).

<a href="http://www.minedata.org"><img src="/images/minedata.jpg" alt="MineData.org homepage"/></a>

The key insight from our research was that violations from inspections could be either good or bad. If the violations are corrected, then the mine becomes safer. If the violations are not fixed, then there are known safety issues. Thus, our model looks at how mines reacted to issued violations. The output is a ["Lives at Risk"](https://www.youtube.com/watch?v=lQ24_gfCYuU) score.

MineData.org was awarded the Audience Prize at the hackathon. In addition, we are excited to now be collaborating with the US Department of Labor to improve the project and manage its long-term upkeep.
