//
//  BudgetManager.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 3.7.22..
//

import UIKit

class BudgetManager {
    
    private var incomes: [Income] = []
    private var costs: [Cost] = []
    
    func generateIncome(account: Account, type: TypesOfIncome, sum: Double, date: Date) {
        let newIncome = Income(account: account, type: type, sum: sum, date: date)
        incomes.append(newIncome)
    }
    
    func generateCost(account: Account, type: TypesOfCost, sum: Double, date: Date) {
        let newCost = Cost(account: account, type: type, sum: sum, date: date)
        costs.append(newCost)
    }
    
    var totalIncomes: Double {
        var sumIncomes: Double = 0
        for income in incomes {
            sumIncomes += income.sum
        }
        return sumIncomes
    }
    
    var totalCosts: Double {
        var sumCosts: Double = 0
        for cost in costs {
            sumCosts += cost.sum
        }
        return sumCosts
    }
    
    var balance: Double {
        totalIncomes - totalCosts
    }

    
}
