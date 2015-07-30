//: [Previous](@previous)

import Foundation

enum SegueIdentifier: String {
  case ShowPhoto
  case NewPhoto
  case Share
}

func performSegue(id: String) {
  if let segue = SegueIdentifier(rawValue: id) {
    handle(segue)
  }
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
