//
//  BudgetData.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 7.7.22..
//

import UIKit

enum IncomeType: String, Codable {
    case salary, social, rent, present, business, investments
}

public var incomeStorageKey = "incomeStorageKey"

public struct Income: Codable {
    var account: BankAccount
    var type: IncomeType
    var sum: Double
    var date: Date?
    var comment: String?
    
    init(account: BankAccount, type: IncomeType, sum: Double, date: Date? = Date(), comment: String? = nil) {
        self.account = account
        self.type = type
        self.sum = sum
        self.date = date
        self.comment = comment
    }

    enum CodingKeys: String, CodingKey {
        case account = "account"
        case type = "type"
        case sum, date, comment
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        account = try container.decode(BankAccount.self, forKey: .account)
        type = try container.decode(IncomeType.self, forKey: .type)
        sum = try container.decode(Double.self, forKey: .sum)
        date = try container.decode(Date?.self, forKey: .date)
        comment = try container.decode(String?.self, forKey: .comment)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(account, forKey: .account)
        try container.encode(type, forKey: .type)
        try container.encode(sum, forKey: .sum)
        try container.encode(date, forKey: .date)
        try container.encode(comment, forKey: .comment)
    }
}
