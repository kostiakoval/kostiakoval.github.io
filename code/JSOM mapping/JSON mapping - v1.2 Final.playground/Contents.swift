//: Playground - noun: a place where people can play

import Foundation

var d: Dictionary = [ "One" : 1]


//We need to extend our dictionary
extension Dictionary {
  
  subscript(k: String) -> Any {
    let k = k as! Key
    return self[k]
  }
}

private extension Dictionary {
  
  var key: String? {
    return self["key"] as? String
  }
  var limit: Int? {
    return self["lmit"] as? Int
  }
}

//Here is what I want

struct Options {
  var key: String?
  var limit: Int?
  
  init(data: [String : AnyObject] ) {
    key = data.key
    limit = data.limit
  }
}

let op = ["key" : "Age", "limit": 10]
let ops = Options(data: op)


private extension Dictionary {
  var name: String? {
    return self["name"] as? String
  }
  
  var age: Int? {
    return self["age"] as? Int
  }
}

// Not optional data
// This looks much uglier
struct Person {
  var name: String
  var age: Int
  
  init?(data: [String : AnyObject] ) {
    if let name = data.name,
      age = data.age {
        self.name = name
        self.age = age
    } else {
      return nil
    }
  }
  
}

let personData = ["name" : "Sam", "age" : 20]
Person(data: personData)





