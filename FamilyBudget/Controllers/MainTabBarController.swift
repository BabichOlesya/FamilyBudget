//
//  MainTabBarController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 20.7.22..
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let incomeController = IncomesViewController()
    incomeController.tabBarItem = UITabBarItem(title: "Incomes", image: UIImage(named: "plus.circle"), tag: 0)
    let incomeNavigationController = UINavigationController(rootViewController: incomeController)

    let budgetController = BudgetViewController()
    budgetController.tabBarItem = UITabBarItem(title: "Budget",
                                               image: UIImage(named: "bag.circle"),
                                               tag: 1)
    let budgetNavigationController = UINavigationController(rootViewController: budgetController)
    
    let expensesController = ExpensesViewController()
    expensesController.tabBarItem = UITabBarItem(title: "Expenses",
                                                 image: UIImage(named: "minus.circle"),
                                                 tag: 2)
    let expensesNavigationController = UINavigationController(rootViewController: expensesController)
    
    viewControllers = [incomeNavigationController, budgetNavigationController, expensesNavigationController]
  }
}
