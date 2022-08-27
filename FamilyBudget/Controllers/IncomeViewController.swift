//
//  IncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class IncomeViewController: UIViewController {
    
    var budgetManager = BudgetManager()
    var currentAccount = BankAccount(name: "Сбер", currency: .rub, balance: 0)

    @IBOutlet weak var tableView: UITableView!
    var incomes = [Income]()
    
    private enum Constant {
        static let buttonViewWidth: CGFloat = 180.0
        static let buttonViewHeight: CGFloat = 50.0
        static let bottomIndentL: CGFloat = 50.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        title = "Доходы"
        
        budgetManager.createIncome(account: currentAccount, type: .salary, sum: 100, date: Date())
        budgetManager.createIncome(account: currentAccount, type: .investments, sum: 2000, date: Date())
        incomes = budgetManager.fetchIncomes() ?? []
        tableView.reloadData()
    }
}

extension IncomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return incomes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeCell", for: indexPath)
      cell.accessoryType = .disclosureIndicator
      let income = incomes[indexPath.row]
      cell.textLabel?.text = "\(income.account.name): \(income.sum)"
      return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCell = tableView.cellForRow(at: indexPath)
    let selectedAccount = selectedCell?.textLabel?.text
    // NSUserDefaults
  }
}
