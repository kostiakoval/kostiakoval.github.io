//: [Previous](@previous)

struct Food: OptionSetType {

  let rawValue: Int
  init(rawValue: Int) { self.rawValue = rawValue }
  init(_ rawValue: Int) { self.rawValue = rawValue }

  static let Ketchup  = Food(1 << 0)
  static let Salt     = Food(1 << 1)
  static let Chili    = Food(1 << 2)
}

let food: Food = [.Ketchup, .Salt]
food.contains(.Ketchup)
food.contains(.Salt)
food.contains(.Chili)

food
print(food)


//: [Next](@next)
