//: [Previous](@previous)

import Foundation

//: [Next](@next)


extension Dictionary where Key : String, Value: Int {
  public var one: AnyObject? {
    return self["One"]
  }
}

var d = [ "One" : 1]
d["One"]
let a = d.one



