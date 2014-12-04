---
layout: post
title: Introducing OpenResolve
category: project
description: Docker Image for Domain Information as a REST-like API
---

Since August I have been co-managing an internship program at OpenDNS for two master's degree candidates from the University of San Francisco. The team built a [Docker](https://www.docker.com/) image that provides domain information via a REST-like API, which we call [OpenResolve](https://www.openresolve.com). The goal of the project was making access to domain information more secure and more accessible. Learn more about the project at [OpenResolve.com](https://www.openresolve.com) or [fork it on Github](https://github.com/opendns/OpenResolve).

## The Pitch 

Internships don't always create value for students, so we aimed to make this project both a good overview of what OpenDNS has to offer and an opportunity to build something cool. Learning how startups develop software compared to a university can be insightful, so we wanted to emphasize a project that would involve learning modern development techniques like containerization, continuous integration, and distributed systems. Spending time on a project then not having something to show for it sucks, so we wanted something meaningful to publish at the end. In this case, we chose to [open source the project](https://github.com/opendns/OpenResolve).


## Use Cases

The overall goal of the project was to improve access to existing domain information. DNS lookups use unencrypted UDP, which makes them somewhat unreliable. We make lookups through OpenResolve more secure by intending for its application pool to be hosted behind a load balancer with SSL. In addition, the DNS requests look like web traffic, so they are less likely to be filtered. Finally, the system allows access to DNS in environments that restrict UDP, thus making it usable for front-end javascript. 

Some ideas for implementations include:

* Accessing DNS in front-end Javascript (for example to confirm whether a provided email address has associated MX domains)
* Comparing caches of recursive DNs providers, perhaps from different geographic locations
* Comparing traditional DNS lookups to OpenResolve to determine DNS hijacking
* Securing system DNS, in particular when UDP is in some way filtered
* Accessing domain information from shipped client software where you may not control the network environment

## Deployment Methodology

We chose to package the application in Docker because it abstracts away the internal workings of the application. By pulling the Docker image and running it, the system is ready to use. We allow for environment variables to specify resolver IP addresses and CORS rules, thus meaning that no changes to the underlying image are required for its use. I suggest hosting it on [AWS Elastic Beanstalk](http://aws.amazon.com/elasticbeanstalk/) (including terminating SSL at the AWS load balancer). You can even host the application on a static IP, thus eliminating its dependency on DNS (try it: [67.215.70.81](http://67.215.70.81/)).

## Try It 

Go to [OpenResolve.com](https://www.OpenResolve.com).



