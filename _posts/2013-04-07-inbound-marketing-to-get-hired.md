---
layout: post
title: Using Inbound Marketing to Get A Job
---

Next month I graduate from engineering school, so two weeks ago I started actively pursuing a software job for after graduation. This wasn't my first time looking for a post-graduation job: I started looking back in November, and I had many problems - the main one being that the startups where I wanted to work lacked the runway to make hiring committments so far in advance. The second difficulty I found with pursuing jobs at startups in November was that they were nowhere as good at the hiring process as large companies. 

So, I postponed my job search. I imposed a new start date of spring break with the hope that making a hiring committment a month out, rather than six, would be more realistic for startups. Realizing that I could use some cleverness to make the hiring process smoother, I implemented a variety of techniques inspired by inbound marketing to gain a foot in the door at my desired comapnies. I set up a landing page here on my personal website, multivariate tested a call to action with Optimizely, and tracked visitor engagement with Mixpanel. 

It worked.

## Landing Page

First, I built a landing page here on my personal website. The goal was to engage visitors with content about my abilities and projects, then  drive them to contact me about an interview.

<a href="/images/hire_me.jpg"><img src="/images/hire_me_small.jpg" alt="Hire Me Page" /></a>

A better landing page would have had a place for the user to enter their email so I could contact them, but my personal website is built with <a href="http://jekyllrb.com/">Jekyll</a>, so there was no dynamic backend to handle this. Rather than build some type of Javascript API or use a solution like Mailchimp, I just placed my email on the page and tracked clicks on the email address.

I linked to my <a href="http://cv.philipithomas.com">resume</a> and <a href="http://github.com/philipithomas">Github</a>, among other pages, to build credibility. 


## Optimizely 

In order to get potential employers to view the landing page, I included a prominent link to it on my site's navigation. I planned to acquire traffic with blog posts, then funnel those visitors to the landing page where they ostensibly contact me about an interview.

The button linking the blog posts to the landing page was  possibly the most important part of the process, so I used . To figure out the best way to increase the visitors to the page, I multi-variate tested the button leading to the job page using <a href="http://optimizely.com">Optimizely</a>.

Optimizely is a SaaS that makes multivariate testing easy - just drop in their Javascript on your website, and use their GUI to specify the changes you want. I heard about Optimizely through articles about the Obama campaign - they used Optimizely extensively to increase donations, with [amazing results](http://kylerush.net/blog/meet-the-obama-campaigns-250-million-fundraising-platform/).

I randomly assigned visitors to one of three possible buttons on the sidebar leading to the landing page: "hire me", "hiring?", or "for hire".

After running the experiment for 18 days with 2924 visitors, there was a clear winner for the most effective button based on the clickthrough rate:

<table class="table">
	<tr><th>Button Text</th><th>Vistors</th><th>Button CTR</th></tr>
	<tr>
		<td>hire me</td>
		<td>1005</td>
		<td>6.8%</td>
	</tr>
	
	<tr>
		<td>hiring?</td>
		<td>936</td>
		<td>7.2%</td>
	</tr>
	<tr>
		<td>for hire</td>
		<td>983</td>
		<td><strong>8.2%</strong></td>
	</tr>
</table>

Note that there are two major problems with the validity of these results. The first is that these posts had a general audience, so the results are for a general audience, not recruiters specifically. Second, clickthrough rate did not necessarily correlate to follow-through by the visitor. To provide additional data on the latter problem, I used Mixpanel. 

## Mixpanel

<a href="http://mixpanel.com">Mixpanel</a> provides an analytics SaaS that focuses on  an individual visitors' progress toward a goal. I used it [with Optimizely](http://support.optimizely.com/customer/portal/articles/605823-how-can-i-integrate-optimizely-with-mixpanel-). I found that about one in 3 visitors who came to the landing page left it almost immediately after clicking on my resume button. I didn't include Mixpanel tracking on the resume, but it also includes my contact information, so this stopped me from being able connect clicks on my email address to the Optimizely campaign.

I think the #1 way to improve this camaign would be an improved landing page. Specifically, a cleaner layout with less links and an email entry form would be better. Creating an email form, rather than just putting my email address, would have allowed for tracking a specific person's actions in Mixpanel, rather than estimating it based on contact times. In addition, I think that my [resume](http://cv.philipithomas.com) should have been integrated with the landing page instead of making them separate. 


## Results

I was fortunate enough to be giving a [speech in San Francisco](/san-francisco-transcript/) just after kicking off the digital campaign. I met with many people while in San Francisco - at the event, at pre-arranged meetings, and even hanging out at coffee shops. I funneled people from in-person meetings to my website with [business cards](/minimalist-business-card/). 

Due to a mix of networking, blog traffic, and outreach to companies, starting about a week into the campaign until it concluded 10 days later, I averaged 3 interviews per business days between nine total companies, all of which I was strongly interested in joining. Of note, I can attribute being ocntacted by at least 3 of those companies directly to the digital campaign. In fact, I received an email from one company stating that they enjoyed one of my articles, then they followed up 5 minutes later with another email saying, "We see that you are looking for a job - CC'd is our hiring manager!"


I was offered a job at my #1 choice in company - [OpenDNS](http;//opendns.com) - and I [accepted the offer](/joining-open-dns/), canceled many outstanding applications, and ended the campaign. My introduction to OpenDNS long predated this digital campaign, so I cannot say that this experiment directly got me a job, but I am sure that many of my interviewers visited the website and the landing page before talking with me. 

Overall, this experiment was successful, and the data from the analytics software shows that even hiring can be optimized. If you are seeking a job or freelance clients, I suggest setting up a personal website and trying out these techniques. 

