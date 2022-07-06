//
//  BudgetManager.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 3.7.22..
//

import UIKit

var incomes: [Income] = []

func generateIncome(_ account: Account, _ itemIncome: TypesOfIncome, _ sum: Int, _ date: Date) -> Income {
    let newIncome = Income(account: account, itemIncome: itemIncome, sum: sum, date: date)
    incomes.append(newIncome)
    
    return newIncome
}

var costs: [Cost] = []

func generateCost(_ account: Account, _ itemCost: TypesOfCost, _ sum: Int, _ date: Date) -> Cost {
    let newCost = Cost(account: account, itemCost: itemCost, sum: sum, date: date)
    costs.append(newCost)
    
    return newCost
}
