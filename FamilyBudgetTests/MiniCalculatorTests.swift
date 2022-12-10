//
//  TestableClassTests.swift
//  FamilyBudgetTests
//
//  Created by Олеся Бабич on 10.12.22..
//

import XCTest
@testable import FamilyBudget



class MiniCalculatorTests: XCTestCase {
    
    var sut: MiniCalculator!
    
    
    override func setUpWithError() throws {
        sut = MiniCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testValueClass() {
        XCTAssertEqual(sut.initialValue, sut.firstNumber)
        XCTAssertEqual(sut.initialValue, sut.secondNumber)
        XCTAssertEqual(sut.secondNumber, sut.firstNumber)
    }
    
    func testSumFirstNumber() {
        sut.firstNumber = 3.0
        XCTAssertEqual(sut.sum, 3.0)
    }
    
    func testSumSecondNumber() {
        sut.secondNumber = 3.0
        XCTAssertEqual(sut.sum, 3.0)
    }
    
    func testDifferenceFirstNumber() {
        sut.firstNumber = 3.0
        XCTAssertEqual(sut.difference, 3.0)
    }
    
    func testDifferenceSecondNumber() {
        sut.secondNumber = 3.0
        XCTAssertEqual(sut.difference, -3.0)
    }
    
    func testDifferenceFunctionFirstNumber() {
        sut.firstNumber = 3.0
        XCTAssertEqual(sut.difficultFunction, 9.0)
    }
    
    func testDifferenceFunctionSecondNumber() {
        sut.secondNumber = 3.0
        XCTAssertEqual(sut.difficultFunction, 3.0)
    }
    
    func testMultiplySumValueMultiplier() {
        sut.multiplySum(by: 3)
        XCTAssertEqual(sut.Tresult, 0)
    }
    
    func testMultiplySumValueMultiplierNegative() {
        sut.multiplySum(by: -5.15)
        XCTAssertEqual(sut.Tresult, 0)
    }
    
    func testMultiplySumValueMultiplierNil() {
        XCTAssertNil(sut.Tresult)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
