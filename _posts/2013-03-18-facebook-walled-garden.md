---
layout: post
title: Walled Garden Approach to Facebook Privacy
---

Facebook left me feeling disconnected and exposed. Sharing new statuses and photos made me  uncomfortable because I did not know which of my 750 digital friends would see the update. The news feed was crowded with advertisements and updates from people I didn't care about. I gravitated away from Facebook and began trying alternatives that focused on core friends, like Path.

<!-- [Facebook Groups](https://www.facebook.com/about/groups) changed some of my feelings - private, relevant content with people I cared about quickly became the main reason I used Facebook. Feedback from my friends seemed to indicated a similar trend - most of their activity on Facebook was on groups for greek life, student groups, and dorms.  -->

My friend [Andrew Hess](http://twitter.com/andhess) introduced me to a new approach to Facebook privacy and security settings that replicate the privacy of Groups. He called the strategy a [Walled Garden](http://en.wikipedia.org/wiki/Closed_platform), which is a computer science term for a heavily-restricted environment. With Facebook, this means choosing core group of people you care about (~50-70), and allowing them full access to all content, while restricting everybody else to almost no content. The strategy uses the [close friends](https://www.facebook.com/help/112320895539157) feature to define this core group and follow their updates. Using this list in place of the news feed also removes annoying in-feed advertisements.

Implementing the this strategy has made me more comfortable with Facebook because I know who is viewing my updates, I see updates I care about, and I feel less exposed. I now use the [check in](https://www.facebook.com/help/461075590584469) feature, share photos often, and feel more connected with the people I care about.

For the rest of the article, I describe the theory and implementation of the Walled Garden strategy. The focuses:

* Define a core group of people (*close friends*) and give them full access to content and updates.

* Restrict all other friends to minimum content.

* Add a safeguard of *restricted friends*

* Remove most or all public content

## Close Friends

The first step is defining a group of *close friends* with whom you wish to share all content, and whose updates you wish to see. I use the Facebook [close friends](https://www.facebook.com/help/112320895539157) list, and on it I have 70 people. All of my statuses, photo albums, wall posts, and likes are strictly visible only to these people. Even my about page is locked down to only show content to the *close friends* list.

The advantage of using Facebook's close friends list feature instead of a generic list is that it does modify the news feed content, should you still use the news feed, and it makes the list easier to differentiate and access across devices.

If I tag somebody in a status or photo, independent of whether they are on the close friends list, they can still see the post and interact with it, which I think is a reasonable compromise. 

Instead of going to the news feed when I want to check Facebook, I have bookmarked the *close friends* list page for easy access. In addition, I have the list marked as a favorite and positioned just under the news feed for easy access on mobile. This means that the content I consume is relevant to me. Furthermore, there are no in-feed ads, such as with the news feed.

## Public Posts and Hellbanning with the Restricted Access List

While the *close friends* list is now my primary means of interacting with Facebook, I still share some statuses outside of the core group. If I am advertising an event with a student group, I will share the update with all of my friends. If I am sharing truly public content, such as blog posts, I will make the post publicly visible. 

I still felt uncomfortable sharing non-public posts with all of my friends. For instance, I am uncomfortable with distant relatives constantly commenting on posts. In addition, there are Facebook friends that I will likely never see again in my life, but I do not wish to unfriend them because it feels like too much of a denouement. 

Fortunately, Facebook has a [restricted access list](https://www.facebook.com/help/204604196335128/#faq_206571136073851) that is the opposite of the close friends list - everybody on it automatically cannot see non-public updates. I call it [hellbanning](http://en.wikipedia.org/wiki/Hellbanning) because they have essentially been unfriended from a privacy standpoint, but they do not know it. In fact, about 250 of my 750 friends are on this list.


## Implementing the Walled Garden

This section is long and includes both Walled Garden privacy settings and general security settings. Even if you do not implement the full strategy, I implore you to review this section to ensure that you understand what each privacy setting does.

### Close Friends Group

* Using the [close friends list](), choose the people you care about and add them to the list. They cannot see their membership.

### Restricted Group

* On your *restricted* list, go to Manage List -> Choose Update Types. Uncheck everything. My default restricted list had everything checked, which may be a bug.

* Add people whom you would otherwise unfriend - bosses, distant relatives, the kid who had the locker next to you in middle school.

### Profile Basics

* Go through every album and change the privacy settings to allow only close friends to view them. Note that, if a person is tagged in a photo, they can still view it. 

* Review all cover photos and consider deleting old ones - these are forced as public, and the only way to lock them down from a privacy perspective is deleting them.

* Review the privacy setting on each profile picture individually. I only keep the active one as **public** and list the rest as *close friends*.

* Review your about page and the privacy setting on each section. 

* Go to "Likes" and change all the favorites and "other pages you like" to *close friends*.

* Review old Notes and change them to *close friends*.


### Suggested Facebook.com/Settings Configuration

** General**

* Under "Email" - uncheck [Allow friends to include my email address in Download Your Information](https://www.facebook.com/download/?h=AaBsnxM29aYpT7Qz)

** Security **

* Enable secure browsing. There is zero reason to have this disabled, and I think it is irresponsible of Facebook to not force everyone to use it. 

* Enable login notifications. You will receive an email every time your account is accessed from a new location, meaning that if your password is leaked you will realize it immediately. 

* Require a security code to access your account from unknown browsers, and enable it to deliver codes to your cell phone or turn on the code generator on the Facebook mobile app. Every time you log in from a new computer, you will not only need your password, but also you will have to enter a code that is sent your phone. This means that, if someone has your password, they also need access to your phone to get access to your account. As an aside, don't worry about what happens if your lose or break your phone - the Facebook account recovery process is among the most efficient and secure I've seen. 

* Right now - remove all the "recognized devices." Just do it. 

* Set "Who can see future posts" to *close friends* for convenience. This makes it the default privacy settings for most actions across devices.

* I highly encourage you to limit the audience for posts you've shared. This means that only your friends can access your former posts. The privacy strategy I've outlined will be effective for future posts, but this tool is the only way to stop the public from still seeing your old posts. Note, however, that this is irreversible.

* Realize that simple GMail tools like [Rapportive](http://rapportive.com/) show the social media accounts associated with every email address, so allowing the public to find you via your email or phone number means that every client, coworker, and family member will have access to your public profile. I allow people to find me with my public email address because I remove almost all information from the public profile. This concept applies to whether you want search engines to find your profile, too.

** Timeline and Tagging **

* Allow only friends to post on your timeline.

* Turn on reviewing posts before they appear on your timeline.

* Turn on reviwing tags people add to your own posts.

* Add "Close Friends"  to the audience when you're tagged in a post. Note that you must click "custom" then manually add *close friends*. Note that *restricted users* are automatically disabled through the group configuration. 

** Mobile ** 

* Delete any old phone numbers right now.

** Followers**

* Consider enabling followers if you will use public posts. This essentially allows you to use Facebook like a public Twitter to share updates to the world. 

** Apps **

* Right now - review every single app under the "you use" column and delete any app that you no longer actively use. This is how much Facebook spam occurs. In addition, give each remaining app the minimum visibility - either "only me" or "close friends" depending on who you want to see posts. 

* On "apps others use" - uncheck **everything**.

* Turn off instant personalization.

** Ads **

* Change "Third Party Sites" to "No one."

* Change "Ads and Friends" to "No one."






### Additional tips

* Use the "Review what other people see on your timeline" feature under the *Timeline and Tagging* section at Facebook.com/Settings to double-check that the views the public, restricted users, general friends, and close friends have.

* If you want to add a middle tier, there is an *acquaintance* list by default that Facebook also includes. I choose not to use it, and instead treat everybody who is not a **close friend** or **restricted user** as an acquaintance.

* Occassionally review "Active sessions" and delete all inactive devices under "recognized devices."

