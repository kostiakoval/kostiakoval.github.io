---
layout: post
title: "Habit of Contributing"
categories:
published: true
---

The iOS developers community has grown tremendously for last few years. I remember those days when there wasn't [cocoapods](http://cocoapods.org). We use those great libs and projects every day, but we should not forget to contribute back to the community.  
  
At this moment many would say, *"Yea, but I don't have time for that"*. Yes, that's true. If you are working as full-time employee, it could be hard to find time for it.  
  
But with cocoapods it's so easy. How often working on project you find some issue or bug in the library, or maybe some missing feature you need? And you think, I'll do changes directly in my project. It's fast and easy.
But there is a better approach. This is great time to contribute.

* [Make a fork](https://help.github.com/articles/fork-a-repo) of the library you find a bug and want to improve  
* Clone your fork
* Change cocapods to fetch it from your fork repo 
* pod 'AFNetworking', :git => 'git@github.com:konstantinkoval/AFNetworking.git'  
* Write code, commit it  
* Make a [pull request](https://help.github.com/articles/creating-a-pull-request)  
  
That's it. It could take you 5 minutes to do that.  
And you get one more benefit! Your changes will be stored remotely. Next time you will run  
`pod install` or `pod update` your changes won't be overridden. And it will be added to the main library.

Try it once, and once again. Than make a habit out of it.