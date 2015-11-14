---
layout: post
title: "Swift and iOS SDK"
categories:
published: true
---

The iOS SKD gets more [Swift-er](https://developer.apple.com/swift/blog/?id=31) and better but still there are sometimes situation when it doesn't work so well. Many **Foundation** and **UIKit** methods are exposed to Swift with `AnyObject` parameters signature. `AnyObject` says that it has to be a class type. And this can be a problem, let's see why. 

Swift has many powerful value types, and they are not class types. This means we can't use them with this Foundation API example.

```swift
func someSDKAPI(x: AnyObject) {
  print(x)
}

struct Person {
  let name: String
}

let person = Person(name: "Sam")
someSDKAPI(person) //Argument type Person
```
![image]({{ site.url }}/images/2015-11-14-swift-and-ios-sdk/1-type-error.png)

<!--![image](/images/2015-11-14-swift-and-ios-sdk/1-type-error.png)-->

And we get an error. This error says that our person instance does not conform to `AnyObject` protocol. That is true because it's a struct and not a class.

To solve that problem we need to make an [Adapter](Adapter_pattern). Basically we need to wrap our `Person` type into a class type and pass an instance of that class to the `someSDKAPI` method

```swift
class Adapter {
  let val: Person

  init(val: Person) {
    self.val = val
  }
}

let adapter = Adapter(val: person)
someSDKAPI(adapter)
```
Now the code compiles and works. Here is the real word problem I've faced and the solution.

### Real use-case Example

I want to use `UILocalizedIndexedCollation` class to sort people by name and group them into sections by alphabet. 
I can't do that because `UILocalizedIndexedCollation` can only work with classes, `AnyObject` type.

```swift
// Returns the index of the section that will contain the object.
public func sectionForObject(object: AnyObject, 
  collationStringSelector selector: Selector) -> Int

// Used for sorting objects within the same section.
public func sortedArrayFromArray(array: [AnyObject],
  collationStringSelector selector: Selector) -> [AnyObject]
```
The solution is same, make an adapter. This time it's a bit more complex because we need to expose name property in the `Adapter` so `UILocalizedIndexedCollation` can use it for sorting.
 
Here is the full code example, It does following things: 

 - Create array of people, `[Person]` type
 - Map them to `[Adapter]` type
 - Use `UILocalizedIndexedCollation` to make sections, sort people and group them into section.
 - Map sorted section `[[Adapter]]` type back to `[[Person]]` type 
 
```swift
struct Person {
  let name: String
}

class Adapter: NSObject {
  let val: Person

  init(val: Person) {
    self.val = val
  }

  var name: String {
    return val.name
  }
}

let collation = UILocalizedIndexedCollation.currentCollation()

let people = [
  Person(name: "Anna"),
  Person(name: "Sara"),
  Person(name: "Alan"),
  Person(name: "Sam")
]

let objects = people.map(Adapter.init)


let selector: Selector = "name"
var sections = Array(count: collation.sectionTitles.count, 
  repeatedValue: [AnyObject]())
let sortedObjects = collation.sortedArrayFromArray(objects, 
  collationStringSelector: selector)

for object in sortedObjects {
  let index = collation.sectionForObject(object, collationStringSelector: selector)
  sections[index].append(object)
}

let groupedPeople = sections.map { $0.map { ($0 as! Adapter).val } }
groupedPeople
```

### Code Example - [Playground](https://github.com/kostiakoval/kostiakoval.github.io/raw/master/code/2015-11-14-swift-and-ios-sdk/Swift_and_iOS-SDK.playground.zip)


