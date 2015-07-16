---
layout: post
title: "Turn Computed Property into Lazy Property"
categories:
published: true
---

```swift  
struct Type {

  static var keys: [String] {
    print("Executed")
    return ["One", "Two"]
  }
}

Type.keys
Type.keys
```


`Type.keys` is a computed property and it is evaluated every time we call it. The `Executed` is printed twice to console. What I want is to turn it into a lazy static property.  It is very simple, add `=` and `()`  

```Swift
struct Type {
  
  static var keys: [String] = {
    print("Executed")
    return ["One", "Two"]
  }()
}

Type.keys
Type.keys

```

We have increase Performance in few seconds and fixed side effects bugs


**P.S**  
Copy-Past the code to the playground for easy testing