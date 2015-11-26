//: Playground - noun: a place where people can play

import UIKit

struct Food: OptionSetType {

  let rawValue: Int
  init(rawValue: Int) { self.rawValue = rawValue }

  static let Ketchup = Food(rawValue: 1)
  static let Salt = Food(rawValue: 2)
  static let Chili = Food(rawValue: 4)
}

let addAll: Food = [.Ketchup, .Salt, .Chili]
addAll.contains(.Ketchup)
addAll.contains(.Salt)
addAll.contains(.Chili)

addAll
print(addAll)