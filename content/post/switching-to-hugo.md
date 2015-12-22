---
date: 2015-12-21T15:17:54-08:00
description: New website layout, and switching from Jekyll to Hugo 
image: /images/cover/2014.jpg
title: Switching from Jekyll to Hugo
---

I'm in the process of rolling out an update to my website. For CSS framework, I switched from [Bootstrap](http://getbootstrap.com) to Google's [Material Design Light](http://www.getmdl.io/). Under the hood, I switched the content compiler from [Jekyll](https://jekyllrb.com/) to [Hugo](https://gohugo.io/). The build system moved from [CircleCI](https://circleci.com/) to [TravisCI](https://travis-ci.org).

{{< figure src="/images/philipithomas_2014.jpg" title="My previous website design" >}}


The move was prompted when I tried to update a spelling mistake on my website. The Jekyll build system failed due to Ruby dependency issues. I liked using a static site generator, but I didn't like the level of Ruby knowledge required to fix this issue. I discovered [Hugo](https://gohugo.io/) and decided to try it out. I liked its extensibility and stability, and before I knew it my site had been rewritten in Hugo. 

I'm continuing to actively make changes and improvements to the site - stay tuned for more updates. To dig deeper, [check out the source code on Github](https://github.com/philipithomas/www.philipithomas.com).