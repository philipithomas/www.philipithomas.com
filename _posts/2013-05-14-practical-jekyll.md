---
layout: post
title: Practical Jekyll Workflow
summary: Suggestions for managing a website that runs on the Jekyll blogging software. 
---
*This post outlines my preferred workflow for Jekyll, a coder-oriented blogging system, by using Cloudflare and Amazon S3.* 

Since December, I have been using [Jekyll](http://jekyllrb.com) to manage multiple blogs and websites. <span class="highlight">In my opinion, Jekyll is the best blogging platform for use by use by a single author who knows how to code and who enjoys tinkering</span>. It has downsides - you cannot update the website (*e.g. to correct a spelling mistake*) from any computer or your phone, media resizing and handling is a largely manual process, and collaborating with multiple authors usually requires a git workflow. But, for a single author who enjoys coding and tinkering, Jekyll combines templating, permalinks, and post management in a familiar tool that feels like a compiler, and the static site it produces deploys to many hosts with incredibly fast results. This week, Jekyll 1.0 was released. 


I have tried hosting Jekyll-produced websites on Heroku, Akamai CDN, Amazon Cloudfront CDN, a Rackspace server with nginx, Github Pages, and more.  The slow spin-up time on Heroku was unbearable, but deployment was easy. Maintenance and deployment on nginx was tedious, especially with security considerations. CDNs delivered blazing speed, but managing 301 and 404 headers was usually impossible, and overcoming caching issues was annoying. Github Pages does not allow [plugins](http://jekyllrb.com/docs/plugins/), and I did not feel comfortable relying on a free host to handle large bursts of traffic. 

I found that [Amazon S3](http://aws.amazon.com/s3/) provided the best Jekyll hosting when considering price, scalability, and ease of use. In addition, I found that combining S3 with [Cloudflare](http://cloudflare.com) for DNS provided many benefits, including 301 redirects, reduced bandwidth, and faster speed. 

The rest of this post assumes <span class="highlight">basic familiarity with Jekyll, git, DNS, and Ruby</span>. 

# Github

While this may seem a given, I use [Git](http://git-scm.com/) version control on my Jekyll directory, and I keep the source for all of my Jekyll-based websites  on Github. This allows me to manage my website from multiple computers, and it provides a backup of the content. [Fork this website on Github](https://github.com/philipithomas/brouhaha). Note that, for security and sanity, a [properly-configured .gitignore file](https://github.com/philipithomas/brouhaha/blob/master/.gitignore) is essential to keep API keys private and the *\_site* folder from being committed. 

When working with multiple authors on a single Jekyll blog, submitting new posts to an "editor" with pull requests is my preferred workflow. In addition, having draft and production branches is possible. 

# Amazon S3

Amazon's [Super Simple Storage](http://aws.amazon.com/s3/), also known as *S3*, provides hosting of static files in a "bucket" at one of Amazon's data centers. Normally, buckets are private and are accessed with cURL requests. However, buckets can be made public, and proper naming of the bucket allows the use of a CNAME record to serve a static website. 

[Amazon S3 pricing](http://aws.amazon.com/s3/pricing/) is cheap and usage-based, so high-traffic websites cost comparatively little, and low-traffic websites generally cost under a dollar per month. HTTP Response times are generally under 700ms, and becuase the assets are hosted in the cloud and static, this response time is inelastic of load. 

With S3, minimal configuration is necessary and, becuase the assets are static, security is quite high. Amazon guarantees 99.99% uptime, and directory index and 404 error pages are straightforward to set up. 

## Deployment with Jekyll-S3 Gem

What converted me to using S3 for all of my websites was the [Jekyll-S3](https://github.com/laurilehmijoki/jekyll-s3) gem. After building the Jeyll site, deployment is as easy as running *jekyll-s3* at the command line for deployment of the site to S3, including removing deleted files.

After [installing the gem](https://github.com/laurilehmijoki/jekyll-s3#install), the first step is creating the *_jekyll_s3.yml* file:

<pre>
s3_id: YOUR_S3_ID
s3_secret: YOUR_S3_ID_SECRET_KEY
s3_bucket: www.example.com
gzip: true
</pre>

**Note**: <span class="highlight">Include this file in your *.gitignore* so that your api keys do not become public!</span>

**Aside**: S3 supports [GZip compression](https://developers.google.com/speed/articles/gzip) for additional speed, and I enable that optional setting here. 

The most important part of using S3 as a web host is that the bucket name must match full domain name of the site where it is hosted. Becuase S3 requires a CNAME record, in general this means that root domains are not allowed. 

Creating a new S3 bucket or configuring an existing S3 bucket for use with Jekyll-S3 is a simple one-time command: 

<pre>
configure-s3-website --config _jekyll_s3.yml
</pre>


To configure your DNS, set the CNAME record to the S3 endpoint URL (available under the "Static Website Hosting" section of the S3 interface). If you are using the default US-East-1 datacenter, this means that your CNAME record should be *www.example.com.s3-website-us-east-1.amazonaws.com*.

From there, build your Jekyll site, then use this command to deploy:
<pre>
jekyll-s3
</pre>


## Downsides

S3 is fast and reliable, but it lacks some key features required for actively managing a website. The first is that it lacks 301 redirects. If you change the permalink structure of your site or rename/delete a page, any SEO-juice from inbound links is lost, and visitors have to be redirected with inelegant javascript. 

Because S3 is served from a single geographic location, speed is dependent on location. A [content delivery network](https://en.wikipedia.org/wiki/Content_delivery_network) for larger files such as images is desirable. 

Finally, uptime for certain data centers in the past has been spotty, and S3 provides no functional error page during one of these outages.


# Cloudflare

While experimenting with Amazon S3, I originally used the complimentary Amazon Route53 DNS. However, I found that using Cloudflare for DNS provided many features that made up for S3 shortcomings. Specifically, Cloudflare's minification, 301 redirects, CDN, security, and always-online features made an easy Jekyll workflow. Best of all, the service has a [generous free tier](http://www.cloudflare.com/plans). 

### Automatic minification

In the pursuit of faster page load times, minification of HTML, CSS, and JS files is essential. When working locally with Jekyll, I have had trouble with minification plugins. Specifically, the popular [Jekyll-Press](https://github.com/stereobooster/jekyll-press) plugin is incompatible with many responsive CSS files due to a buried dependency on an outdated gem. 

Cloudflare will automatically minify HTML, CSS, and JS files. In the workflow, this means that there was one less dependency and slightly faster build time for Jekyll locally. 

### 301 Redirects

The [Page Rules](http://blog.cloudflare.com/introducing-pagerules-fine-grained-feature-co) feature in Cloudflare allows custom 301 and 302 redirects based on regular expressions. Because Cloudflare operates at the DNS level, this means that 301 redirects can be incorporated into an S3-hosted website. Note that Cloudflare [limits the number of page rules heavily](http://www.cloudflare.com/plans), especially for a free plan, but for a personal website with a minor link change, this tool is invaluable. 

### CDN

Cloudflare includes a free content delivery network that serves images, stylesheets, and javascript files. This service overcomes the geography limitation of S3 by propagating the largest files to endpoints around the world. In addition, by serving these files from the CDN instead of S3, hosting costs are significantly reduced. Based on my Cloudflare statistics, <span class="highlight">I have had an 80% bandwidth reduction, and hence an 80% S3 cost saving, on [philipithomas.com](http://www.philipithomas.com) due to serving popular image-heavy posts with Cloudflare CDN</span>.  


### Security

Cloudflare originated as a security product, and it excels at keeping spam and malicious visitors from accessing websites. It shines at [averting DDOS attacks](http://blog.cloudflare.com/the-ddos-that-almost-broke-the-internet), and it protects some of the largest websites on the internet. 

Because Jekyll creates static websites, and because Amazon S3 speeds are inelastic of load, malicious visitors and speed reductions due to [DDOS](https://en.wikipedia.org/wiki/Denial-of-service_attack) are usually of little concern. However, with 3rd-party javascript, such as a commenting system, enabling some security features may be desirable. The main reason to implement Cloudflare security features in this setup is to save money. If your site is under a DDOS attack, the biggest danger is high bandwidth usage and hence high S3 costs. Cloudflare can be configured to challenge malicious visitors at the DNS level, hence preventing wasted bandwidth and wasted money. In general, though, I disable most Cloudflare security features on production websites. 

### Always Online

While S3 guarantees less than about 45 minutes of S3 outages per month, [prominent outages have occurred](http://www.forbes.com/sites/anthonykosner/2012/06/30/amazon-cloud-goes-down-friday-night-taking-netflix-instagram-and-pinterest-with-it/). When this happens, your website is completely unavailable. 

Cloudflare provides a feature called [Always Online](http://www.cloudflare.com/always-online) that serves an automatic fallback from cached static assets should a website host fail. In this workflow, this means that the normal website is fully available, with a "Cloudflare Always-On" banner, in the rare case that S3 should go down.  

# Conclusion

Jekyll is a blogging platform made for tinkering, and I hope that this article has provided some insight into how far the sytem may be pushed in terms of creating a workflow that combines speed, scalability, and usability.

If you are just jumping in to the world of Jekyll, [fork this website](http://github.com/philipithomas/brouhaha) and start experimenting! 
