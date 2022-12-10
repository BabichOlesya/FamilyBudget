//
//  BudgetManager.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 3.7.22..
//

import Foundation

public enum Transaction {
  case income, expense
}

public protocol FinanceInformation {
  var account: BankAccount { get }
  var transactionType: Transaction { get }
  var amount: Double { get }
}

public class BudgetManager {
    
    static var shared = BudgetManager()
  
    private(set) var incomes = [Income]()
    private var expenses = [Expense]()
  
    func createIncome(account: BankAccount, type: IncomeType?, amount: Double, date: Date) {
        let newIncome = Income(account: account, type: type ?? .business, amount: amount, date: date)
        saveIncome(newIncome)
    }
    
    func createExpense(account: BankAccount, type: ExpenseType, amount: Double, date: Date) {
        let newExpense = Expense(account: account, type: type, amount: amount, date: date)
        saveExpense(newExpense)
    }
  
    var totalIncomes: Double {
      incomes.map{ $0.amount }.reduce(0, +)
    }
    
    var totalExpenses: Double {
      expenses.map{ $0.amount }.reduce(0, +)
    }
    
    var balance: Double {
      totalIncomes - totalExpenses
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
