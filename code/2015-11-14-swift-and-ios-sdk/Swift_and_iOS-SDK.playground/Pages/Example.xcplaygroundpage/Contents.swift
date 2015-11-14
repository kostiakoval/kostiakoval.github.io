import Foundation

func someSDKAPI(x: AnyObject) {
  print(x)
}

struct Person {
  let name: String
}

let person = Person(name: "Sam")
//someSDKAPI(person)

//: Make Adapter

class Adapter {
  let val: Person

  init(val: Person) {
    self.val = val
  }
}

let adapter = Adapter(val: person)
someSDKAPI(adapter)
