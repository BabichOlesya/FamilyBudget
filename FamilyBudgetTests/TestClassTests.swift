//
//  TestClassTests.swift
//  FamilyBudgetTests
//
//  Created by Tatiana Mudryak on 28.10.22.
//

import XCTest
@testable import FamilyBudget

class TestClassTests: XCTestCase {

  func testSum() {
    var sut = TestClass()
    sut.x = 5
    sut.y = 10
    XCTAssertEqual(sut.sum, 15)
  }
  
}
