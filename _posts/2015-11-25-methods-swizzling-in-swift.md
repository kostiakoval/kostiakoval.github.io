---
layout: post
title: "Methods Swizzling in Swift"
categories: swift
published: true
---

#### [Download Playground  ](/code/2015-11-25-methods-swizzling-in-swift/Methods-Swizzling.playground.zip)[![Playground](/images/swift-playground.png)](/code/2015-11-25-methods-swizzling-in-swift/Methods-Swizzling.playground.zip)


Methods Swizzling is very powerful, dangerous technique and at the same time very easy to use.  
Swift is static typed and safe programming language, and I it 😍😘❤️. But sometimes you git a wall where you need a bit of dynamic behaviour.

As an example I want to override `description` method of a `UIColor`. I can't do that because methods overriding doesn't work in [Objc categories](http://stackoverflow.com/questions/5272451/overriding-methods-using-categories-in-objective-c) :(

So the solution is to use [Method Swizzling](http://nshipster.com/method-swizzling/). This doesn't sound like a **Swifty** approach, but actually it is. Here is the solution.

```swift
public extension UIColor {

  func colorDescription() -> String {
    let color = "Some Custom text Here"
    return color
  }

  public class func swizzleDesription() {
    let instance: UIColor = UIColor.redColor()
    let aClass: AnyClass! = object_getClass(instance)

    let originalMethod = class_getInstanceMethod(aClass, "description")
    let swizzledMethod = class_getInstanceMethod(aClass, "colorDescription")
    method_exchangeImplementations(originalMethod, swizzledMethod)
  }
}

UIColor.swizzleDesription()
print(UIColor.redColor())
```

It just works 🙌🎉.  
**P.S.** -  The class has to inherit from `NSObject` and has dynamic runtime behaviour 
    
But we can do better. The swizzling technique is not unique to just `UIColor` class, but it's a generic and can be used with any `NSObject` subclass. Let's do refactoring baby `re-🏭`-ing ))).

```swift

// Swizzling
extension NSObject {

  class func swizzleMethods(origSelector: Selector, withSelector: Selector, 
    forClass: AnyClass) {
    
    let originalMethod = class_getInstanceMethod(forClass, origSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, withSelector)
    method_exchangeImplementations(originalMethod, swizzledMethod)
  }

  func swizzleMethods(origSelector: Selector, withSelector: Selector) {
    let aClass: AnyClass! = object_getClass(self)
    NSObject.swizzleMethods(origSelector, withSelector: withSelector, forClass: aClass)
  }
}

// Use Swizzling
public extension UIColor {

  func colorDescription() -> String {
    return "Some Custom text Here"
  }

  public class func swizzleDesription() {
    let instance: UIColor = UIColor.redColor()
   instance.swizzleMethods("colorDescription", withSelector: "description")
  }
}

UIColor.swizzleDesription()
print(UIColor.redColor())

```

That's it, Thanks :) 🙇