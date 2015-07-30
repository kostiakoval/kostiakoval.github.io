//: [Previous](@previous)

import Foundation

infix operator <^> {
associativity left
precedence 130
}

public func <^> <T, U>(@noescape f: T -> U, a: T?) -> U? {
  return a.map(f)
}

enum SegueIdentifier: String {
  case ShowPhoto
  case NewPhoto
  case Share
}

func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  handle <^> segue
}

func handle(segue: SegueIdentifier) {
  switch segue {
  case .ShowPhoto:
    print("Perform ShowPhoto")
  case .NewPhoto:
    print("Perform NewPhoto")
  case .Share:
    print("Perform Share")
  }
}

performSegue("ShowPhoto")
performSegue("Delete")

//: [Next](@next)
