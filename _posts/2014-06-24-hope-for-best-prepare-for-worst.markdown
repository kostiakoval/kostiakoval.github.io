---
layout: post
title: "Hope for Best - Prepare for Worst"
categories: workflow strategy planing
published: true
---

Recently I've published iOS quiz game. I've been doing iOS for almost 5 years but I've never faced so many troubles during lease phrase. This post is about what can go wrong, how to prepare for it.   
How much time do you need to release an app. It takes approximately about 1 week for app review.

### Apple can reject your binary
Alway add this to your estimate, event if your app is really simple and you are sure that you haven't broke any review guidelines point.   
In my case apple just updated review guidelines 1 day before I've submitted my app. So it was rejected (after a 1 week of review).  
**Time estimate + 1 week.**

### Test it, test it well
We have tested it a lot. We made few internal releases, but event thou we found a critical bug, after app was approved and released to app store, that we had to fix.  
Thanks to Apple Review team, we get that fix with expedited review and it took 2 days.  
**Time estimate + 1 week.** 

### Thing you can't thing of will fail
There is going to be a lot issues bugs and crashes. Prepare for them.
Use bugs and crash reporting tool. Here is few of my favorite:  

* [Crashlytics](http://try.crashlytics.com)
* [Google Analytics](http://www.google.com/analytics/mobile/)
* [BugSense](https://www.bugsense.com)
* [TestFlight](https://www.testflightapp.com)

I use a lot Google Analytics and I like to have my errors report there sa well. A But I also use BugSense. It give more detailed information about crashed.


### Log Errors  
I'm sure you have written this type of code. Just handle success case but not error. 
 
{% highlight objc %}
NSError * error = nil;
BOOL isOK = [object doSmt:&error];  
if(isOk) {
  //continue program
}  
{% endhighlight %}

Or like this  

{% highlight objc %}
NSInteger index = [ar indexOfObject:object];
if (index != NSNotFound) {
  //continue program
}
{% endhighlight %}

Is some cases we assume that bad thing won't happen in this pice of code. In other cases we can't continue execution if the result is wrong. 
But at least we should log those errors to remote issue tracker.
{% highlight objc %}
- (void)logError:(NSError *)error
{
  if (error) {
    NSDictionary *errorData = [[GAIDictionaryBuilder createExceptionWithDescription:   
	error.description withFatal: @(NO)] build];
     [[[GAI sharedInstance] defaultTracker] errorData];
  }
}
{% endhighlight%}




