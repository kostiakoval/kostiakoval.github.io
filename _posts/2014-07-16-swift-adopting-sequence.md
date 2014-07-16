---
layout: post
title: "Swift - Adopting Sequence"
categories: Swift
published: true
---

I was impleting my own Stack collection based on the [WDDC session video](https://developer.apple.com/videos/wwdc/2014/#404-video). After implemeting Sequence protocol, I thought that this look like a generic code. 

```
extension Stack : Sequence {
 func generate() -> StackGenerator<T> {
    return StackGenerator(items: items[0..<items.count])
  }
}

struct StackGenerator<T> : Generator {
   mutating func next() -> T? {
    if items.isEmpty { return nil }
    let ret = items[0]
    items = items[1..<items.count]
    return ret
  }
  
  var items: Slice<T>
}

```

I've start looking for alsternative. There is `SequenceOf<T>` and `GeneratorOf<T>`in Swift
Let's use that

```
extension Stack : Sequence {
 func generate() -> GeneratorOf<T> {

  var items = self.items[0..<self.items.count]
  return GeneratorOf({
    if items.isEmpty { return nil }
        let ret = items[0]
        items = items[1..<items.count]
        return ret
    })
  }
}
```
This looks better, but not perfect. My Stack is using Arrray<T> as storage. Array has addopted Sequence alredy. Maybe we could use it's implementation. I found [an article](http://robots.thoughtbot.com/swift-sequences) that does exactly what I want

```
extension Stack : Sequence {
 func generate() -> IndexingGenerator<[T]> {
    return items.generate()
  }
}
```