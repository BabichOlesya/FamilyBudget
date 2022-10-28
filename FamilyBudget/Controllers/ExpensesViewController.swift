//
//  CostViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 18.7.22..
//

import UIKit

class ExpensesViewController: UITableViewController {

    var currentAccount = BankAccount(name: "Сбер", currency: .rub)
    var expenses = [Expense]()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      title = "Expenses"
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExpense))
      
      let nib = UINib(nibName:"InfoTableViewCell", bundle: nil)
      tableView.register(nib, forCellReuseIdentifier: InfoTableViewCell.identifier)
      
      BudgetManager.shared.createExpense(account: currentAccount, type: .clothes, amount: 100, date: Date())
      BudgetManager.shared.createExpense(account: currentAccount, type: .coffee, amount: 2, date: Date())
      expenses = BudgetManager.shared.fetchExpenses() ?? []
    }
    
    @objc func addExpense() {
      let viewController = AddCostViewController()
      navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ExpensesViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    expenses.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as! InfoTableViewCell
    cell.transaction = expenses[indexPath.row]
    cell.setup()
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
    
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    60.0
  }
}
