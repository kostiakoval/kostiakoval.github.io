
import Foundation

enum SegueIdentifier: String {
  case ShowPhoto
  case NewPhoto
  case Share
}

func performSegue(id: String) {
  let segue = SegueIdentifier(rawValue: id) //SegueIdentifier?
}

performSegue("ShowPhoto")
performSegue("Delete")

//: [Next](@next)