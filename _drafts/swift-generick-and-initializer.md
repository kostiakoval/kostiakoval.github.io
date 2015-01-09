---
layout: post
title: "Swift Generick and Initializer"
categories:
published: false
---

Le't have a look on this code

```
class A {
  var items: [Int]

  public init (_ items: [Int] ) {
    self.items = items
  }
  
  public convenience init (_ item: Int) {
    self.init([item])
  }

  public convenience init () {
    self.init([])
  }
}

class B : A {
  func printMe() {
    println("Me")
  }
  
}

let a = A()
let b = B()
```


Let's make this code generic, cahnge Int to T

```
class A<T> {
  var items: [T]

  public init (_ items: [T] ) {
    self.items = items
  }
  
  public convenience init (_ item: T) {
    self.init([item])
  }

  public convenience init () {
    self.init([])
  }
}

class B<T> : A<T> {
  func printMe() {
    println("Me")
  }
  
}

```  

We get error `error: 'B<T>' is not constructible with '()'let b = B()`
Even thou we have't added any property to class we have to override constructor

