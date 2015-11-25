//: [Previous](@previous)

import UIKit

extension NSObject {

  class func swizzleMethods(origSelector: Selector, withSelector: Selector, forClass: AnyClass) {
    let originalMethod = class_getInstanceMethod(forClass, origSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, withSelector)

    method_exchangeImplementations(originalMethod, swizzledMethod)
  }

  func swizzleMethods(origSelector: Selector, withSelector: Selector) {
    let aClass: AnyClass! = object_getClass(self)
    NSObject.swizzleMethods(origSelector, withSelector: withSelector, forClass: aClass)
  }
}

public extension UIColor {

  func colorDescription() -> String {
    return "Some Custom text Here"
  }

  public class func swizzleDesription() {
    let instance: UIColor = UIColor.redColor()
   instance.swizzleMethods("colorDescription", withSelector: "description")
  }
}

UIColor.swizzleDesription()
print(UIColor.redColor())
