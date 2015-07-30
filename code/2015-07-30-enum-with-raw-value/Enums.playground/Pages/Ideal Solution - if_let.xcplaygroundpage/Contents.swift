//: [Previous](@previous)

import Foundation

func if_let<T>(x: T?, fn: (T) -> Void) {
  if let x = x {
    fn(x)
  }
}

enum SegueIdentifier: String {
  case ShowPhoto
  case NewPhoto
  case Share
}

func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id)
  if_let(segue, fn: handle)
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

