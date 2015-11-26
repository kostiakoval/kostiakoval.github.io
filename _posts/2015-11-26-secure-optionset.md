---
layout: post
title: "Secure OptionSetType"
categories:
published: true
---
#### [Download Playground  ](/code/2015-11-26-secure-optionset/OptionSetType.playground.zip)[![Playground](/images/swift-playground.png)](/code/2015-11-26-secure-optionset/OptionSetType.playground.zip)

So, Swift has this super nice [OptionSetType](https://developer.apple.com/library/ios/documentation/Swift/Reference/Swift_OptionSetType_Protocol/index.html). Here is a simple example of a `Food` `OptionSetType`. It represents things you can add to your Burger 🍔.

```swift
struct Food: OptionSetType {

  let rawValue: Int
  init(rawValue: Int) { self.rawValue = rawValue }

  static let Ketchup = Food(rawValue: 1)
  static let Salt = Food(rawValue: 2)
  static let Chili = Food(rawValue: 4)
}

let addAll: Food = [.Ketchup, .Salt, .Chili]
addAll.contains(.Ketchup)  //true
addAll.contains(.Salt) 	   //true
addAll.contains(.Chili)   //true

```
And life seems to be Awesome! 😇🙌.  

**BUT❗️**  
`OptionSetType` has a security whole for possible bugs. The `OptionSetType` is represented as a [BitMask](https://en.wikipedia.org/wiki/Mask_(computing)). The rules for a bitmask is that every element must have an unique binary value representation. In human language every next value has to be multiplied by 2. *Example - 1, 2, 4, 8 ...*

Here by mistake (which I often do, I'm sorry I'm only a human, not a PC ☺️) we assign `.Chili` rawValue 3.  
Let's see why it's dangerous.  

```swift
struct Food: OptionSetType {

  let rawValue: Int
  init(rawValue: Int) { self.rawValue = rawValue }

  static let Ketchup = Food(rawValue: 1)
  static let Salt = Food(rawValue: 2)
  static let Chili = Food(rawValue: 3)
}

let food: Food = [.Ketchup, .Salt]
food.contains(.Ketchup)	  //true
food.contains(.Salt)	  //true
food.contains(.Chili)    //true
```
So now I ask for a Ketchup and Salt `[.Ketchup, .Salt]` but as a result I also get some `.Chili`💥  
To understand better why it's happening you can print `food` variable to a console.

```swift
print(food) 
//Food(rawValue: 3)
```
The bitmask sums its items rawValues `.Ketchup` + `.Salt` = 3. The `.Chili` also has the rawValue 3 and this is why we got that error.

### What can we do about that? 

**Solution 1** - Better rawValues  

```swift
struct Food: OptionSetType {

  let rawValue: Int
  init(rawValue: Int) { self.rawValue = rawValue }
  init(_ rawValue: Int) { self.rawValue = rawValue }

  static let Ketchup  = Food(1 << 0)
  static let Salt     = Food(1 << 1)
  static let Chili    = Food(1 << 2)
  static let Sugar    = Food(1 << 3)
  ...
}
```
We can use a shift `<<` operator. Then we would increate shifting number by 1. It would be easier to spot the wrong number.  
But! Still, I'm a human and I do mistakes. ☺️😅 I would prefer a PC to check it for me.

**Solution 2** - Unit Test  
The other idea is that we could write a Unit Test that would check that for us.  

```swift
class FoodTests: XCTestCase {
  let allCases: [Food] = [.Ketchup, .Salt, .Chili]

  func testAllCasesAreEven() {
    let allValues = allCases.map { $0.rawValue }
    let oddValues = allValues.filter { $0 % 2 != 0 }

    XCTAssertEqual(oddValues.count, 1)
    XCTAssertTrue(oddValues.first! == 1)
  }

  func testAllCasesAreUnique() {
    let rawValues = allCases.map {$0.rawValue }
    let uniqueValues = Set(rawValues)

    XCTAssertEqual(uniqueValues.count, rawValues.count)
  }
}
```
That's exactly what I wanted. Now if I make any mistake, the compiler will catch me 😁😬. So now I can safely go and eat burgers knowing that I didn't get any chili in it by mistake :)
