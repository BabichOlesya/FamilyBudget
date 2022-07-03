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

var mainCount = Count(name: "Сбер", currency: .rub, balance: 0)

var newIncome = AddIncome(count: mainCount, itemIncome: .salary , sum: 100, date: Date.now)
var newCost = AddCost(count: mainCount, itemCost: .alcohol, sum: 50, date: Date.now)

func generateIncome() {
    
    var incomeArray = [Int]()
    for i in 100...120 {
        incomeArray.append(i)
    }
}

