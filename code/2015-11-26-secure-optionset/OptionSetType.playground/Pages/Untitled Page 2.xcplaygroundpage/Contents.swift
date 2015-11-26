//: [Previous](@previous)

struct Food: OptionSetType {

  let rawValue: Int
  init(rawValue: Int) { self.rawValue = rawValue }

  static let Ketchup = Food(rawValue: 1)
  static let Salt = Food(rawValue: 2)
  static let Chili = Food(rawValue: 3)
}

let food: Food = [.Ketchup, .Salt]
food.contains(.Ketchup)
food.contains(.Salt)
food.contains(.Chili)

food
print(food)


//: [Next](@next)
