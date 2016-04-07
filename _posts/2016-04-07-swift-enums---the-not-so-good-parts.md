---
layout: post
title: "Swift enums - the not so good parts"
categories:
published: true
---

Enums in Swift are really powerful and awesome. They can have raw values, associated values, properties and methods, they have powerful and save pattern matching and etc. Enums are awesome new candy and everyones want to use them ASAP. I did that too 😊. But we shouldn't forget about other tools we have in our disposal. 

## Example:   
I want to have different login options in my App. It's taken from a nice talk ["Simplifying Login with Swift Enums"](https://realm.io/news/david-east-simplifying-login-swift-enums/)


```swift
enum LoginProvider {
    case Facebook
    case Email(LoginUser)
}
    
struct LoginUser {
    let email: String
    let password: String
    func isValid() -> Bool {
        return email != "" && password != ""
    }
}

```
What we did here is, we made a `LoginProvider` type with 2 options: `Facebook` and `Email`. That's the 2 login options we have in our app. The `Email` options needs an additional data which we pass as an associated value. Very simple, let's move on.

Now we want to add 2 methods: `isValid` and `login`

```swift
enum LoginProvider {
  func login() {
        switch self {
        case let .Email(user):
            print("login with email: \(user)")
        case .Facebook:
            print("login with Facebook")
        }
    }

    var isValid: Bool {
        switch self {
        case let .Email(user):
            return user.isValid()
        case .Facebook:
            print("Facebook is invalid :P")
            return false
        }
    }
}
```
In both of them we do a switch on `self` a **LoginProvider** type, and depending on current option, we call corresponding implementation.  

And it works. Everyone is happy 😊🎉. Until we need to add new login option.   
Let's add  few more Login option.


```swift
enum LoginProvider {
    case Facebook
    case Email(LoginUser)
    case Twitter
    case Google
    case Phone(String)
    func login() {
        switch self {
        case let .Email(user):
            print("login with email: \(user)")
        case .Facebook:
            print("login with Facebook")
        case .Twitter:
            print("login with Twitter")
        case .Google:
            print("login with Google")
        case let .Phone(phone):
            print("login with Phone: \(phone)")
        }
    }

    var isValid: Bool {
        switch self {
        case let .Email(user):
            return user.isValid()
        case .Facebook:
            print("Facebook is invalid :P")
            return false
        case .Twitter:
            print("Twitter random ") //¯\_(ツ)_/¯
            return arc4random_uniform(2) == 1
        case .Google:
            print("Google yes")
            return true
        case let .Phone(phone):
            print("login with Phone: \(phone)")
            return phone.isValid()
        }
    }
}
```

To add new options we have to:

1. Edit existing `LoginProvider` enum type and add new options. 
2. Edit every function where we accused `LoginProvider` case value.

Basically - to add new item, we have to modify existing code. And that breaks the second point in [**SOLID**](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) architecture. The **[O](https://en.wikipedia.org/wiki/Open/closed_principle)** part.

**Open/Closed principle**  

> Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.

Can we do better? Yes we can, by using old good protocols and dynamic dispatch.  
  
**Step N1** Make a protocol that describes a behaviour of our `LoginProvider`  

```swift
protocol LoginProvider {
    func login()
    var isValid: Bool { get }
}
```

**Step N2** - Make login providers that conforms to that protocol

```swift
//FacebookLoginProvider.swift
struct FacebookLoginProvider: LoginProvider {
    func login() {
         print("login with Facebook")
    }
    var isValid: Bool {
        print("Facebook is invalid :P")
        return false
    }
}

//EmailLoginProvider.swift
struct EmailLoginProvider: LoginProvider {
    var user: LoginUser
    func login() {
        print("login with email: \(user)")
    }

    var isValid: Bool {
        return user.isValid()
    }
}
```

The big difference here is that each login provider is a separate entity and they don't know anything about each other. Those 2 types are separate swift files.  
If you want to add new type, you don't need to modify existing code. All you need to do is make a new type and conform to `LoginProvider` protocol

```swift
struct TwitterLoginProvider: LoginProvider {
    func login() {
        print("login with Twitter")
    }

    var isValid: Bool {
        return arc4random_uniform(2) == 1
    }
}
```
That it. And you can simple use that new `TwitterLoginProvider ` without changing existing code

```swift
var provider: LoginProvider = TwitterLoginProvider()
provider.login()

```

## Wrap up
Enums are great for representing finite set of cases of a type, like WeekDays, Planets, Gender, etc. If your type describe a behavior, like login behavior, and there a big probability that you will add a new Item of that type, then maybe it would be better to use protocols. 

**Know your weapon and use it wisely**

**P.S**
Thanks to David East for inspiration to write this post.