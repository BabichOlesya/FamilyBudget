//
//  IncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class IncomesViewController: UITableViewController {
    var currentAccount = BankAccount(name: "Сбер", currency: .rub)
    
    var incomes = [Income]()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      title = "Incomes"
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addIncome))
      
      let nib = UINib(nibName:"InfoTableViewCell", bundle: nil)
      tableView.register(nib, forCellReuseIdentifier: InfoTableViewCell.identifier)
      
//      BudgetManager.shared.createIncome(account: currentAccount, type: .salary, amount: 100, date: Date())
//      BudgetManager.shared.createIncome(account: currentAccount, type: .investments, amount: 2000, date: Date())
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      incomes = BudgetManager.shared.fetchIncomes() ?? []
      tableView.reloadData()
    }
  
    @objc func addIncome() {
      let viewController = AddIncomeViewController()
      navigationController?.pushViewController(viewController, animated: true)
    }
}

extension IncomesViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    incomes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as! InfoTableViewCell
    cell.transaction = incomes[indexPath.row]
    cell.setup()
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let selectedCell = tableView.cellForRow(at: indexPath) as! InfoTableViewCell
      let selectedItem = selectedCell.transaction as? Income
      let infoController = InfoViewController()
      infoController.currentIncome = selectedItem
      navigationController?.pushViewController(infoController, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    60.0
  }
}
