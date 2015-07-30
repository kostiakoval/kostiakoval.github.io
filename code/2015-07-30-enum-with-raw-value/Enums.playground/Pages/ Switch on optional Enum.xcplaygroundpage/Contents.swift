//: [Previous](@previous)

import Foundation

enum SegueIdentifier: String {
  case ShowPhoto
  case NewPhoto
  case Share
}

func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  switch segue {
  case .Some(.ShowPhoto):
    print("Perform ShowPhoto")
  case .Some(.NewPhoto):
    print("Perform NewPhoto")
  case .Some(.Share):
    print("Perform Share")
  case .None:
    print("Wrong raw value")
  }
}

performSegue("ShowPhoto")
performSegue("Delete")


//: [Next](@next)
