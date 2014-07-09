---
layout: post
title: "Fixing WWDC closure code"
categories:
published: true
---

If you try code about closures for [WWDC 2014 session 403](https://developer.apple.com/videos/wwdc/2014/?include=403#403) you will see this error  

```objc
class TemperatureNotifier {

The problem is that onChange closure is taking 1 `Int` parameter, and it has to be specified in the body of the closure. There is a simple fix to it.    
You have to declare variable names in closure.

```objc
class TemperatureNotifier {

class TemperatureNotifier {
