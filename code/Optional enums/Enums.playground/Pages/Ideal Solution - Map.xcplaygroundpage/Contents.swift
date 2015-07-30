//: [Previous](@previous)

import Foundation

enum SegueIdentifier: String {
  case ShowPhoto
  case NewPhoto
  case Share
}

func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  segue.map(handle)
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

