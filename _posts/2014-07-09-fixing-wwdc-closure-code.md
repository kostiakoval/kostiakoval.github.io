---
layout: post
title: "Fixing WWDC closure code"
categories:
published: true
---

If you try code about closures for [WWDC 2014 session 403](https://developer.apple.com/videos/wwdc/2014/?include=403#403) you will see this error  

```objc
class TemperatureNotifier {    var onChange: (Int) -> Void = {}    var currentTemp = 72 }```  
`'Int' is not a subtype of '()'`  
The problem is that onChange closure is taking 1 `Int` parameter, and it has to be specified in the body of the closure. There is a simple fix to it.    
You have to declare variable names in closure.

```objc
class TemperatureNotifier {    var onChange: (Int) -> Void = {x in}    var currentTemp = 72 }```  Or use [shorthand style](https://developer.apple.com/library/prerelease/mac/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html) and make explicit return, to return void
```objc
class TemperatureNotifier {    var onChange: (Int) -> Void = {$0; return}    var currentTemp = 72 }```  
Closures are really great feature of Swift and it provides awesome functional programming style. But as I can see now they are a bit broken. Hope it will be solved soon
