//: [Previous](@previous)

import Foundation
// XCTest assert is not available in Playground. You need to move this code to a TestProject.

struct Food: OptionSetType {

  let rawValue: Int
  init(rawValue: Int) { self.rawValue = rawValue }
  init(_ rawValue: Int) { self.rawValue = rawValue }

  static let Ketchup  = Food(1 << 0)
  static let Salt     = Food(1 << 1)
  static let Chili    = Food(1 << 2)
}

import XCTest

class FoodTests: XCTestCase {
  let allCases: [Food] = [.Ketchup, .Salt, .Chili]

  func testAllCasesAreEven() {
    let allValues = allCases.map { $0.rawValue }
    let oddValues = allValues.filter { $0 % 2 != 0 }

    XCTAssertEqual(oddValues.count, 1)
    XCTAssertTrue(oddValues.first! == 1)
  }

  func testAllCasesAreUnique() {
    let rawValues = allCases.map {$0.rawValue }
    let uniqueValues = Set(rawValues)

    XCTAssertEqual(uniqueValues.count, rawValues.count)
  }
}