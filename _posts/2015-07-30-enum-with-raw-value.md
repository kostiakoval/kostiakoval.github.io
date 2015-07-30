---
layout: post
title: "Handling Enums with Raw values"
categories:
published: true
---

## Intro
I have an en enum with associated raw values. I use a very popular and well know enum for representing SegueIdentifiers but it can be any other enum with raw values.

```swift
enum SegueIdentifier: String {
  case ShowPhoto
  case NewPhoto
  case Share
}
```
> Sift 2.0 enums get default String values, like that   
> `case ShowPhoto = "ShowPhoto"`

Now I want to create an enum instance from the raw String value and perform some actions depending on the enum case.

## Create enum instance from raw value

**Step 1** - Create an instance of the enum from the raw value

```swift
func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id) //SegueIdentifier?
}
performSegue("ShowPhoto")
performSegue("Delete") //Wrong raw value
```

The enum with raw values implements `RawRepresentable` protocol. You can create it from the raw value and you can get its raw value. The init method is **failable**, this means that init could fail and return nil. This makes sense because we could pass wrong raw value to the init method.

```Swift 
protocol RawRepresentable {
    init?(rawValue: Self.RawValue)
    var rawValue: Self.RawValue { get }
}
```
**Step 2** - Handle enum case

## Handle Enum value

I need to handle each enum case and perform some corresponding actions for them. There are few ways to do that and I want to show them all here. 

**1.** **Unwrap and handle**

```swift
func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  if let segue = segue {
    switch segue {
    case .ShowPhoto:
      print("Perform ShowPhoto")
    case .NewPhoto:
      print("Perform NewPhoto")
    case .Share:
      print("Perform Share")
    }
  }
}
```

Because `SegueIdentifier(rawValue: id)` init method returns an optional SegueIdentifier first we need to unwrap it. Then if it's not nil we can handle its case.

This code looks ok but there few things I don't like: 
 
 - Nested `if let` 
 - It's not Singe Responsible. It unwraps optional value **AND** handle Enum cases
 - It's not the ["Golden / Happy Path"](http://www.wikiwand.com/en/Happy_path)" code style. The right side code indent `>>>`, which could eventually become this:
 
![image]({{ site.url }}/images/2015-07-30-enum-with-raw-value/code-indent.jpg)

**2. Switch on optional Enum** 

```swift
func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  switch segue {
  case .Some(.ShowPhoto):
    print("Perform ShowPhoto")
  case .Some(.NewPhoto):
    print("Perform NewPhoto")
  case .Some(.Share):
    print("Perform Share")
  case .None:
    print("Wrong raw value")
  }
}
```
We can make a switch on the optional `SegueIdentifier?` without unwrapping it. This way we need to handle optional `nil` value in the switch and each case statement need to use `.Some` to access the value. 

We get right on right side code indent but we introduced new Complexity. Now each case include information about optional type handling, the `.Some` keyword.

## Ideal Solution

What I want: 

- Switch should be performed on non-optional `SegueIdentifier` type
- Clean "Golden Path" code indent
- A [SRP](http://www.wikiwand.com/en/Single_responsibility_principle) functions that does Only 1 thing

I find the solution N1 to be better and I will use it as a base and improve it. First to solve **Single Responsibility** problem I will move enum cases handling to separate method

```swift
func performSegue(id: String) {
  if let segue = SegueIdentifier(rawValue: id) {
    handle(segue)
  }
}

func handle(segue: SegueIdentifier) {
  switch segue {
  case .ShowPhoto:
    print("Perform ShowPhoto")
  case .NewPhoto:
    print("Perform NewPhoto")
  case .Share:
    print("Perform Share")
  }
}
```

Now it looks better but it's not perfect yet. There is still small nested `if let` code. Let's get rig of that.

## Get rid of if let { ... }

**1. Use map**

```swift
func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  segue.map(handle)
}
```
Use the Optional `map` function `func map<U>(@ noescape f: (T) -> U) -> U?`

**2. if_let function**

If you think that a `map` should be used only for data transformation and it shouldn't be used for performing actions, you can use `if_let` function proposed by [Colin Eberhardt](http://blog.scottlogic.com/2014/12/08/swift-optional-pyramids-of-doom.html).

```swift
func if_let<T>(x: T?, fn: (T) -> Void) {
  if let x = x {
    fn(x)
  }
}

func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  if_let(segue, fn: handle)
}
```

**3. Operators**

If you like Haskell and Custom operators, you can use [Runes](https://github.com/thoughtbot/runes)
or make own operator (Use runes!!!)

```swift
infix operator <^> {
associativity left
precedence 130
}

public func <^> <T, U>(@ noescape f: T -> U, a: T?) -> U? {
  return a.map(f)
}

func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  handle <^> segue
}
```

This is it :)

### Final notes

-  Strive to **Single Responsible** code: Classes, components, and even functions
-  Well know Custom operators are not scary, love them, use them :)

Code Example - [Playground]({{ site.url }}/code/2015-07-30-enum-with-raw-value)





