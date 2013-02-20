---
layout: post
title: The Importance of Load Testing
---

This morning, the Washington University in St. Louis emergency alert system was activated with the following message:

>A potential THREAT TO SAFETY exists on the Danforth Campus. GO TO A SECURE LOCATION and remain there until further notice. For further information visit [emergency.wustl.edu](http://emergency.wustl.edu)

This message was sent via text message, email, and phone call to every student and employee at the university. Every TV screen and university-owned computer screen switched to a display of the message. [In-building notification systems](http://www.alertus.com/beacon/) displayed the message with flashing lights and a siren. The campus megaphone system activated with sirens and and a recording of the message. 

Shortly therafter, a second message was sent: 
> The campus emergency is over. You may resume your normal activities. Go to emergency.wustl.edu for more information.


Unfortunately, most students (me included) received the "all clear" message before the "threat to safety" message, thus creating confusion. 

Thus, everybody began to navigate to [emergency.wustl.edu](http://emergency.wustl.edu) to understand the situation. **There, they found the emergency notification website unavailable. ** The number of visitors had crashed the website.

Due to the confusion, a third message was broadcast to campus: 

> There is no emergency at Washington University in St. Louis. At approximately 10:36 am this morning an emergency message was accidentally sent out. There is NO EMERGENCY. We apologize for any inconvenience or alarm.

In a debrief email sent later in the day, it was revealed that, during training, the real emergency notification system was accidentally activated. Buried in the email, the university acknowledged the unavailability of the website: 

>Q: Why couldn’t some people access the emergency website, as instructed?
>A: Simply put, the site was overwhelmed with traffic and crashed. While the whole scenario was unfortunate and caused undue alarm, learning about this defect in our system today is the most valuable part of the experience. The University is investigating why this happened and will be recommending a solution.


The failure of an emergency notification website during a declared emergency due to load is a preventable error and highlights the necessity of load testing. Services like [Blitz.io](https://www.blitz.io/) and [Load Impact](http://loadimpact.com/) allow the simulation of traffic on a website. Simulating the hypothetical 15,000 members of Washington University simulataneously accessing the emergency website in a one-minute period could have revealed the need for updates to the page's load tolerance. Had this been a real emergency, failure of this website could have had grave reprecussions.

While the need for load testing emergency pages is clear, it is also important to load test status pages that could receive high traffic during an outage, applications that could experience a spike due to news or social media traffic, or infrastructure pages that could be the target of a DDOS attack. 

Don't let your application fail during an emergency or traffic surge - use load testing to verify scalability!