//: Playground - noun: a place where people can play

import UIKit

var str: String = "Hello, playground"


protocol StringKey : CollectionType {
  subscript(k: String) -> AnyObject { get }
}

extension Dictionary {

  subscript(k: String) -> Value? {
    let k = k as! Key
    return self[k]
  }
  
  var one: Int? {
    return self["One"] as? Int
  }
}

var d: Dictionary = [ "One" : 1]
d["One"]
d.one




/*
extension Dictionary {
  
  func key(k: String) -> Key {
    return k as! Key
  }
  
  var limit: Int? {
//   let a = self["limit"]
    return self[key("limit")] as? Int
  }
}
*/
extension SequenceType where Generator.Element == Int {
  var sum: Int {
    return reduce(0) { $0 + $1 }
  }
}
