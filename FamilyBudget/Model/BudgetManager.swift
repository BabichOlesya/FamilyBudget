//
//  BudgetManager.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 3.7.22..
//

import UIKit

public var incomeStorageKey = "incomeStorageKey"

public class BudgetManager {
    
    private var incomes = [Income]()
    private var costs: [Cost] = []
    private var costStorageKey = "costStorageKey"
    
    func createIncome(account: BankAccount, type: IncomeType, sum: Double, date: Date) {
        let newIncome = Income(account: account, type: type, sum: sum, date: date)
        saveIncome(newIncome)
    }
    
    func createCost(account: BankAccount, type: CostType, sum: Double, date: Date) {
        let newCost = Cost(account: account, type: type, sum: sum, date: date)
        costs.append(newCost)
    }

    var totalIncomes: Double {
        var sumIncomes: Double = 0
//        for income in incomes {
//            //sumIncomes += income.sum
//        }
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

//    NSUserDefaults
//    KeyChain
//    CoreData
}

/** Сохраняем и получаем данные с помощью классов JSONEncoder / JSONDecoder **/
extension BudgetManager {
    func saveIncome(_ income: Income) {
        incomes.append(income)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(incomes) {
            UserDefaults.standard.set(encoded, forKey: incomeStorageKey)
        }
    }
    
    func fetchIncomes() -> [Income]? {
        if let savedIncomes = UserDefaults.standard.object(forKey: incomeStorageKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedIncomes = try? decoder.decode([Income].self, from: savedIncomes) {
                return loadedIncomes
            }
        }
        return nil
    }
    
}
