---
layout: post
title: Locked out of your iPhone today? 
description: Apple locks developers out of iOS7 Beta
---

This afternoon, did your iPhone unexpectedly display "Activation Required" and lock you out? Then, after attempting the activation process, did you receive an error message that 
"Your iPhone could not be activated because the activation server is temporarily unavailable"?

<img src="/images/iphonefail.jpg" alt="iPhone Activation Required" />

If so, you were probably running iOS7 Beta, and you did not update to the production iOS7 after its release. 

It is unclear whether Apple intended to deactivate beta users or whether this is a developer infrastructure outage. When plugging the phone into your computer, iTunes does not sync and is unable to back up, but iPhoto still syncs.

<h3>Fixing the Problem</h3>
The solution I found through the [Apple Developer Forum](https://devforums.apple.com) requires an Apple Developer account, and this process preserved the data on my phone:

* <a href="https://developer.apple.com/devcenter/ios/index.action#downloads">Download iOS 7.0.2 from the Apple Developer Center</a> (Developer login required)

* With your iPhone connected to your computer, option-click on the "Check for Update" button. Select the iOS7.0.2 file that you just downloaded. 

* The software will install, and your device should return to normal.

