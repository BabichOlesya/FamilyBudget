//
//  BudgetManager.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 3.7.22..
//

import Foundation

public class BudgetManager {
    
    static var shared = BudgetManager()
  
    private var incomes = [Income]()
    private var expenses = [Expense]()
  
    func createIncome(account: BankAccount, type: IncomeType, sum: Double, date: Date) {
        let newIncome = Income(account: account, type: type, sum: sum, date: date)
        saveIncome(newIncome)
    }
    
    func createCost(account: BankAccount, type: ExpenseType, sum: Double, date: Date) {
        let newExpense = Expense(account: account, type: type, sum: sum, date: date)
        saveExpense(newExpense)
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
        for expense in expenses {
            sumCosts += expense.sum
        }
        return sumCosts
    }
    
    var balance: Double {
        totalIncomes - totalCosts
    }
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
    
  func saveExpense(_ expense: Expense) {
      expenses.append(expense)
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(expenses) {
          UserDefaults.standard.set(encoded, forKey: expenseStorageKey)
      }
  }
  
  func fetchExpenses() -> [Expense]? {
      if let savedExpenses = UserDefaults.standard.object(forKey: expenseStorageKey) as? Data {
          let decoder = JSONDecoder()
          if let loadedExpenses = try? decoder.decode([Expense].self, from: savedExpenses) {
              return loadedExpenses
          }
      }
      return nil
  }
}
