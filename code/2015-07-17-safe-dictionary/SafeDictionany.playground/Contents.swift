//: Playground - noun: a place where people can play

import UIKit

var remoteKeys = ["Play", "Stop"]
var LocalKyes = ["1", "2"]


/// Code 1
var keys = [
  "Play" : "1",
  "Stop" : "2",
  "Puppies" : "Puppies_HACK_THE_APP" // Compiler error! No Puppies here
]

keys["Puppies"]


//: One of the ways is to map it with using Enum and cast every items

enum Actions : String {
  case Play = "Play"
  case Stop = "Stop"
}

let items: [Actions: String] = [
  .Play : "1",
  .Stop : "2",
//  .Puppies : "Puppies_HACK_THE_APP" // - Error, yes :)
]

////:1. Extend dictionary
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

//:2. Use it and Boom! Happines

let safeKeys =  items.map { key in key.rawValue }








