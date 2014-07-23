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

``` objc
class Dog {
    var name = "Bobik"
    private var id: String
    private(set) var type: String
    
    private init (id: String, UUID: String, type: String) {
        self.id = id
        self.type = type
    }
    
    init() {
        id = "1"
        type = "Dog"
    }
    private func bite() {
        println("Bite ")
    }
    public func fed () {
        println("Mniam Mniam")
    }
    internal func debugState () {
        println("Debug state")
    }
}
```