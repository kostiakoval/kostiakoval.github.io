//: Playground - noun: a place where people can play

import Foundation


struct Options {
  var key: String?
  var limit: Int?
  
  init(data: [String : AnyObject] ) {
    key = data["key"] as? String
    limit = data["limit"] as? Int
  }
}

let op = ["key" : "Age", "limit": 10]
let ops = Options(data: op)


// Not optional data
// This looks much uglier
struct Person {
  var name: String
  var age: Int
  
  init?(data: [String : AnyObject] ) {
    if let name = data["name"] as? String,
      age = data["age"] as? Int {
        self.name = name
        self.age = age
    } else {
      return nil
    }
  }
}

let personData = ["name" : "Sam", "age" : 20]
Person(data: personData)

//Here is what I want



