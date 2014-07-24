---
layout: post
title: "Access Control in Swift"
categories:
published: true
---

In Xcode6 Beta4 was added Access Control to Swift.  
> • **private** entities can only be accessed from within the source file where they are defined.!  
  • **internal** entities can be accessed anywhere within the target where they are defined.!  
  • **public** entities can be accessed from anywhere within the target and from any other context that imports the current target’s module.!  
  
By defaul is used **internal** access control.


{% highlight objc %}
private func id() {
  //code here
}
    
public func fullName () {
  //code here
}

internal func debugState () {
  //code here
}

{% endhighlight %}

We can also set acess control to the properties. You can make a get of a property to be more accessible than its set. 

{% highlight objc %}

 private var id: String
 private(set) var type: String

{% endhighlight %}

Swift Access Control is in development at the moment. It's not perfect yet. I'm looking forward to see how it will be improved

Read more about [Access Control](https://developer.apple.com/swift/blog/?id=5) on Apple Swift blog.  
On [Apple Devforums](https://devforums.apple.com/message/1009118#1009118) is a great discussion this new feature.