import Foundation
var d = [ "One" : 1]
d["One"]

extension Dictionary {
  
  subscript(k: String) -> Any {
    let k = k as! Key
    return self[k]
  }
}

d["One"]
//var [String : NSObject]
//let [String : NSObject]
var d3 = ["100" : 1, "a" : "a"]
if let a = d3["100"] as? Int {
  a
}




let d1 = [ 100 : 1]
d1[100]

let d2: [Int : Any] = [100 : 1, 200 : "a"]
let a2: Any = d2[100]
