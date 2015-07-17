---
layout: post
title: "Static typed Safe Dictionary"
categories:
published: true
---

### Task: Map [String] -> [String]
I need to map String keys to some other String keys `[String] -> [String]`. I have some defined keys and I want to map them to different keys. This could be a StoryboardIds, some actions from server etc. 

As example let's say we have `["Play", "Stop"]` keys and we need to map them to `["1", "2"]`.  
The fist idea is to use `Dictionary`.

```swift
var keys = [
  "Play" : "1",
  "Stop" : "2"
]
```

Ok this works, **But**. There is problem with this solution. The keys in the dictionary are not static typed. You can make a **_Typo_** or use whatever string value you want for keys. 

```swift 
var keys = [
  "Plau" : "1",
  "Puppies" : "Puppies_HACK_THE_APP" // I want a Compiler ERROR! No Puppies here
]

keys["Puppies"]
```

That's not what we wanted. Can we do it better? Yes we can. We can use `enum`  

```swift
enum Actions : String {
  case Play = "Play"
  case Stop = "Stop"
}
// In Swift 2.0 it's even better, no need to define string raw values. 😍 Swift 2.0

let items: [Actions: String] = [
  .Play : "1",
  .Stop : "2",
//  .Puppies : "Puppies_HACK_THE_APP" // - Error, yes :)

]
```

Ok now we have a static typed safe dictionary of Actions and its related keys `[Actions: String]`, but we wanted `[String : String]` mapping. What we need to do is map every `Action` key to its raw String value. 


```swift
let safeKeys =  items.map { key in key.rawValue }
```
> [Actions: String] doest not have a member named 'map' 

Ok, we see an error that dictionary doesn't have a `map` method. We can fix it by adding it.

```swift
extension Dictionary {
  
  init(_ elements: [Element]){
    self.init()
    for (k, v) in elements {
      self[k] = v
    }
  }
  
  func map<U>(transform: Key -> U) -> [U : Value] {
    return Dictionary<U, Value>(Swift.map(self, { (key, value) in
      (transform(key), value) }))
  }
}
```

This is it. Now it works. Here is a [Gist](https://gist.github.com/kostiakoval/17a0da68f3661b3f8d25) with code.  
This solution should work not only for `[String] -> [String]` mapping but for every value you want.