//
//  Income.swift
//  FamilyBudget
//
//  Created by Tatiana Mudryak on 26.08.22.
//

import Foundation

public struct BankAccount {
  var name: String
  var description: String?
  var currency: Currency
  var balance: Double = 0.0

  init(name: String, description: String? = nil, currency: Currency) {
    self.name = name
    self.description = description
    self.currency = currency
  }
}

extension BankAccount: Codable {
    enum CodingKeys: String, CodingKey {
        case name, description, currency = "currency", balance
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String?.self, forKey: .description)
        currency = try container.decode(Currency.self, forKey: .currency)
        balance = try container.decode(Double.self, forKey: .balance)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(currency, forKey: .currency)
        try container.encode(balance, forKey: .balance)
    }
}
