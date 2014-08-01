---
layout: post
title: "Swift - property with private setter and public getter"
categories:
published: true
---

Apple has added [Access Control](https://developer.apple.com/swift/blog/?id=5) to Swift, and it's awesome

```
class Person {
  public var name: String
  private var UUID: NSUUID
}
``` 
Usually we want to disable modification of the properties for rest of the system, make a **black-box** component. In the documentation it says
> Swift allows the get of a property to be more accessible than its set.

```
class Person {
  public var name: String
  private(set) var UUID: NSUUID
}
```

This will make `set` private, but `get` gets default access control level (default is internal).
If we want to make it `public` than we have to write it this way

```
class Person {
  public var name: String
  public private(set) var UUID: NSUUID
}
```
We have to specify access level twice, once for variables (both getter and setter) and second is for setter.


