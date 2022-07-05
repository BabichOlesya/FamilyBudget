//
//  BudgetManager.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 3.7.22..
//

import UIKit

enum Currency {
    case rub
    case eur, usd, gbp
}

struct Count {
    var name: String
    var description: String?
    var currency: Currency
    var balance: Int
}

enum Income {
    case salary, social, rent, present, business, investments
}

enum Cost {
    case food, clothes, sport, health, education, vacation, auto, communal, rent, coffee, alcohol, entertainment
}

struct AddIncome {
    var count: Count
    var itemIncome: Income
    var sum: Int
    var date: Date
    var comment: String?
}

struct AddCost {
    var count: Count
    var itemCost: Cost
    var sum: Int
    var date: Date
    var comment: String?
}

struct Transfer {
    var send: Count
    var get: Count
}

