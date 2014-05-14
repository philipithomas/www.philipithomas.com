---
layout: post
title: HTML5 Developer Conference - Day 2 
description: Speeches and experiences at the second day of the 2013 HTML5 Developer Conference in San Francisco
category: essay
---
<img src="/images/html5Day2.jpg" alt="HTML5 Developer Conference Day 2" />

The second and last day of the [HTML5 Developer Conference](http://html5devconf.com/) started with what would be the best speech I saw at the conference. Following [yesterday's disappointing keynote by Intel](/html5-conference-day-2/), the Adobe keynote, [How cupcakes, Alice in Wonderland and baby elephants are moving the web forward](https://github.com/adobe-webplatform/html5devconf-2013) by Arno Gourdal was an intriguing look at the power of web apps and HTML5 animation. 

The talk focused on the power of "Web Native" applications. Adobe open source projects like [Topcoat](http://topcoat.io), a CSS framework, and [Phonegap](http://phonegap.com/), a tool for creating mobile applications using only web components, clearly position the company as a resource for modern web design. In addition, today Adobe released [Snap.svg](http://snapsvg.io/), a Javscript library for manipulating vector SVG images on the web. 

The demonstrations by Arno were insane. In collaboration with National Geographic, Adobe developed a [Plight of the Baby Elephants](http://adobe-webplatform.github.io/Demo-for-National-Geographic-Orphan-Elephants/) article that made excellent use of viewport units. The craziest animation was a [visualization of Alice in Wonderland](http://adobe-webplatform.github.io/Demo-for-Alice-s-Adventures-in-Wonderland/) that uses the new CSS regions standard for polygonal text boxes in a scoll-based dynamic animation. After a trickling of cupcake references throughout the pesentation, Arno presented a project with Food Network for an interactive cupcake recipe book using Photoshop-level mask, blend, and clipping styles. After teasing the crowd with cupcake references for an  hour, Arno kindly announced that the Adobe booth would be giving away free cupcakes at the conclusion of the talk. 

Veteran progammer Doug Crawford from Paypal gave a TED-talk like presentation on the philosophy of programming language design, such as typing and inheritence. As a member of the committee that steers the development of the language, his insight into the design and ongoing changes to  Javscript were fascinating. 

Peter Hunt from the Instagram team at Facebook spoke about "Rethinking Best Practices" with regard to [React.js](http://www.reactjs.com/), a Javascript library recently open-sourced by Facebook. Proclaiming that "Data changing over time is the root of all evil," the talk served as my introduction to the stack-agnostic library that has challenged many paradigms of modern web development. The hall was standing room only, and the audience seemed glued to the presentation as their philosophies of development were being challenged with concepts such as a virtual DOM that re-renders the whole view with every data update. While details of how to start using React in a new project seemed fuzzy, large software projects, up to and including the Facebook code base, have implemented it successfully due to its ability to seamlessly interface with most frameworks. 

[Christopher Chedeau](http://blog.vjeux.com/) from Facebook gave the most quantitative talk I saw at the conference, where he discussed the design of image layout algorithms. "Not everybody is instagram and has only square images." By reverse-engineering layouts from websites such as Flickr, 500px, and Lightbox, he presented an intriguing talk about how to best display images of different dimensions while minimizing whitespace and minimizing cropping. By the end, techniques were quite sophisticated - for instance, one algorithm was derived from the shortest path algorithm used in [LaTeX](http://en.wikipedia.org/wiki/LaTeX) to optimize line wrapping by modeling break points in a paragraph as a search tree. I suggest perusing [his blog posts on the subject](http://blog.vjeux.com/category/image). The brilliant algorithm for Google Image search results was left "as an excercise for the reader."

Overall, I enjoyed my experience at the 5th HTML5 Developer Conference. I offer the following 3 pieces of advice for improving next year's event:

1. Assign rooms based on anticipated interest level, rather than donor level. There were several talks I was unable to attend because the room was packed, and other attendees seemed equally frustrated.

2. Open source the conference website (perhaps in Jekyll). Speakers can pull request their information, thus avoiding the many broken links and spelling mistakes that plague the current site. 

3. Have speakers check in before their talks. Encountering no-show speakers was quite annoying. 

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/philipithomas">@philipithomas</a> Massive scheduling failure. Completely my fault. Fixing this ASAP; expect a video later today : <a href="http://t.co/Yc67E69SZm">http://t.co/Yc67E69SZm</a></p>&mdash; Colt McAnlis (@duhroach) <a href="https://twitter.com/duhroach/statuses/393061965464997888">October 23, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
