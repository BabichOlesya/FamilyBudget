//
//  BudgetManagerTests.swift
//  FamilyBudgetTests
//
//  Created by Tatiana Mudryak on 02.12.22.
//

import XCTest
@testable import FamilyBudget

class BudgetManagerTests: XCTestCase {
    
    var sut: BudgetManager!
    let bankAccount = BankAccount(name: "test", currency: .rub)
  
    // устанавливаем состояние теста
    override func setUpWithError() throws {
        sut = BudgetManager.shared
    }

    // обнуляем состояние теста
    override func tearDownWithError() throws {
        sut = nil
    }

    func testDoubleIntDefaultValue() {
      //XCTAssertEqual(sut.doubleInt, 10)
    }

//    func testDoubleInt() {
//      sut.someInt = 6
//      XCTAssertEqual(sut.doubleInt, 12)
//    }
  
  func testCreateIncome() {
    sut.createIncome(account: bankAccount, type: .business, amount: 10.0, date: Date())
    let result = sut.incomes.last as! Income
    XCTAssertFalse(sut.incomes.isEmpty)
    XCTAssertTrue(sut.incomes.count > 1)
    XCTAssertEqual(result.account.name, "test")
    XCTAssertEqual(result.account.currency, .rub)
    XCTAssertEqual(result.type, .business)
    XCTAssertEqual(result.amount, 10.0)
  }
  
  func testCreateIncomeNoType() {
    sut.createIncome(account: bankAccount, type: nil, amount: 10.0, date: Date())
    let result = sut.incomes.last as! Income
    XCTAssertEqual(result.account.name, "test")
    XCTAssertEqual(result.account.currency, .rub)
    XCTAssertEqual(result.type, .investments)
    XCTAssertEqual(result.amount, 10.0)
  }
  
  func testTotalIncomes() {
    sut.createIncome(account: bankAccount, type: .business, amount: 10.0, date: Date())
    sut.createIncome(account: bankAccount, type: .business, amount: 20.0, date: Date())
    XCTAssertEqual(sut.totalIncomes, 30.0)
  }
  
  func testBalance() {
    sut.createIncome(account: bankAccount, type: .business, amount: 10.0, date: Date())
    // XCTAssertEqual(sut.balance, ...)
  }
}

