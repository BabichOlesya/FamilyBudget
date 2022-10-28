//
//  Expense.swift
//  FamilyBudget
//
//  Created by Tatiana Mudryak on 28.10.22.
//

import Foundation

public var expenseStorageKey = "costStorageKey"

enum ExpenseType: String, Codable {
    case food, clothes, sport, health, education, vacation, auto, communal, rent, coffee, alcohol, entertainment
}


struct Expense: FinanceInformation, Codable {
  var account: BankAccount
  var transactionType: Transaction = .expense
  var type: ExpenseType
  var amount: Double
  var date: Date?
  var comment: String?
  
  init(account: BankAccount, type: ExpenseType, amount: Double, date: Date? = Date(), comment: String? = nil) {
      self.account = account
      self.type = type
      self.amount = amount
      self.date = date
      self.comment = comment
  }
  
  enum CodingKeys: String, CodingKey {
      case account = "account"
      case type = "type"
      case amount, date, comment
  }

  public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      account = try container.decode(BankAccount.self, forKey: .account)
      type = try container.decode(ExpenseType.self, forKey: .type)
      amount = try container.decode(Double.self, forKey: .amount)
      date = try container.decode(Date?.self, forKey: .date)
      comment = try container.decode(String?.self, forKey: .comment)
  }
  
  public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(account, forKey: .account)
      try container.encode(type, forKey: .type)
      try container.encode(amount, forKey: .amount)
      try container.encode(date, forKey: .date)
      try container.encode(comment, forKey: .comment)
  }
}
