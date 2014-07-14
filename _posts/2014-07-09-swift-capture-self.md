---
layout: post
title: "Swift - Capture self in block is fixed"
categories: Swift
published: true
---

Do you remember issue of implicitly captured self in block and reference cycle in Objective-C? 
  
  
```objc
// implicit self reference
^{
    name = @"name";
 };
 
// Fixed version 
__weak typeof(self)weakSelf = self;
^{
  	__strong typeof(weakSelf)strongSelf = weakSelf;
    strongSelf.name = @"name";
 };
```  

In swift this is fixed now. This is the code

```
{[unowned self] newName in
  self.name = newName
}
```

1. All reference to self in a closure must be explicit. You will see this compiler error -  
*reference to property 'name' in closure requires explicit 'self.' to make capture semantics explicit*  
2. Capture list
We can declare what object should be weak or unowned in the closure. The syntax is  
`[ /*reference type*/ /*object*/, ... ]`

Documentation about [ARC and Resolving Strong reference cycle ](https://developer.apple.com/library/prerelease/mac/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-XID_66)  
You can find more in [WWDC 2014 - Intermediate Swift](https://developer.apple.com/videos/wwdc/2014/?id=403)
