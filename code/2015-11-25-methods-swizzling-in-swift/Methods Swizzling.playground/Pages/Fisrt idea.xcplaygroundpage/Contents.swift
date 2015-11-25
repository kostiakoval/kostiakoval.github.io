//: Playground - noun: a place where people can play

import UIKit

public extension UIColor {

  func colorDescription() -> String {
    return "Some Custom text Here"
  }

  public class func swizzleDesription() {
    let instance: UIColor = UIColor.redColor()
    let aClass: AnyClass! = object_getClass(instance)

    let originalMethod = class_getInstanceMethod(aClass, "description")
    let swizzledMethod = class_getInstanceMethod(aClass, "colorDescription")
    method_exchangeImplementations(originalMethod, swizzledMethod)
  }
}

UIColor.swizzleDesription()
print(UIColor.redColor())
