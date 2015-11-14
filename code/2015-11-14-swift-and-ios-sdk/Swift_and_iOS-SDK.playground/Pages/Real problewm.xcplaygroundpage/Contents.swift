//: Playground - noun: a place where people can play

import UIKit

struct Person {
  let name: String
}

class Adapter: NSObject {
  let val: Person

  init(val: Person) {
    self.val = val
  }

  var name: String {
    return val.name
  }
}

let collation = UILocalizedIndexedCollation.currentCollation()

let people = [
  Person(name: "Anna"),
  Person(name: "Sara"),
  Person(name: "Alan"),
  Person(name: "Sam")
]

let objects = people.map(Adapter.init)


let selector: Selector = "name"
var sections = Array(count: collation.sectionTitles.count, repeatedValue: [AnyObject]())
let sortedObjects = collation.sortedArrayFromArray(objects, collationStringSelector: selector)

for object in sortedObjects {
  let index = collation.sectionForObject(object, collationStringSelector: selector)
  sections[index].append(object)
}

let groupedPeople = sections.map { $0.map { ($0 as! Adapter).val } }
groupedPeople
