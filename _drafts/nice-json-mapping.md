---
layout: post
title: "Nice JSON mapping"
categories:
published: false
---


Extend dictionary and add properties for lookup by the keys there


```swift
extension Dictionary {
  var limit: Int? {
    let a = self["limit"]
    return 10
  }
}
```


Swift v 1.2

```swift
protocol StringKey {
  typealias Value
  subscript(k: String) -> Value? { get }
}
  
extension Dictionary {
  subscript(k: String) -> Value? {
    return self[k as! Key]
  }
  
  var one: Int? {
    return self["One"] as? Int
  }
}
```