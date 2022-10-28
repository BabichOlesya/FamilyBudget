//
//  BudgetManagerTests.swift
//  FamilyBudgetTests
//
//  Created by Tatiana Mudryak on 28.10.22.
//

import XCTest
@testable import FamilyBudget

class BudgetManagerTests: XCTestCase {

  private let manager = BudgetManager.shared
  private let currentAccount = BankAccount(name: "Сбер", currency: .rub)
  
  func testTotalIncomeGetvalue() {
    manager.createIncome(account: currentAccount, type: .salary, sum: 100, date: Date())
    XCTAssertEqual(manager.totalIncomes, 100)
  }

}
