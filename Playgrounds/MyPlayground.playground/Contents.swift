//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//:# - Blog
//:# filtering nils

private func filterNils<S : SequenceType, E where S.Generator.Element == Optional<E>> (source: S, includeElement: (S.Generator.Element) -> Bool) -> [E] {
  
  let f = filter(source, includeElement)
  let m = f.map { $0! }
  return m
}


//: # Blog - Maping [String] -> [String] 

//: One of the ways is to map it with using Enum and cast every items

enum RequestItem : String {
  case Sex = "Sex"
  case BloodType = "BloodType"
  case DateOfBirth = "DateOfBirth"

}

func toHealthKitType(item: String) -> String {
  if let item =  RequestItem(rawValue: item) {
    switch item {
    case .Sex:          return "1"
    case .BloodType:    return "2"
    case .DateOfBirth:  return "2"
    }
  }
  fatalError("error")
}


//:The otehr ways is to use Dicitonary

//:1. Extend dictionary
extension Dictionary {
  
  init(_ elements: [Element]){
    self.init()
    for (k, v) in elements {
      self[k] = v
    }
  }
  
  func map<U>(transform: Key -> U) -> [U : Value] {
    return Dictionary<U, Value>(Swift.map(self, { (key, value) in (transform(key), value) }))
  }
}

//:2. Use it and Boom! Happines


let items: [RequestItem: String] = [
  .Sex         : "1",
  .BloodType   : "2",
  .DateOfBirth : "2"]

let strs =  items.map { key in key.rawValue }
