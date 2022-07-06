//
//  BudgetData.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 7.7.22..
//

import UIKit

enum Currency {
    case rub, eur, usd, gbp
}

struct Account {
    var name: String
    var description: String?
    var currency: Currency
    var balance: Double
}

enum TypesOfIncome {
    case salary, social, rent, present, business, investments
}

enum TypesOfCost {
    case food, clothes, sport, health, education, vacation, auto, communal, rent, coffee, alcohol, entertainment
}

struct Income {
    var account: Account
    var itemIncome: TypesOfIncome
    var sum: Int
    var date: Date
    var comment: String?
}

struct Cost {
    var account: Account
    var itemCost: TypesOfCost
    var sum: Int
    var date: Date
    var comment: String?
}

struct Transfer {
    var send: Account
    var get: Account
}
