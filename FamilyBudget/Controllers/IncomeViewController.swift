//
//  IncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class IncomeViewController: UIViewController {
    
  var budgetManager = BudgetManager()
  var currentAccount = Account(name: "Сбер", currency: .rub, balance: 0)

  @IBOutlet weak var tableView: UITableView!
  var accounts = ["Acc1", "Acc2", "Acc3", "Acc4"]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.dataSource = self
    tableView.delegate = self
    title = "Доходы"
    addConstraints()
  }

    private lazy var addIncomeButton: UIButton = {
        let addIncomeButton = UIButton()
        addIncomeButton.setTitle("Добавить", for: .normal)
        addIncomeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addIncomeButton.backgroundColor = .systemGray2
        addIncomeButton.layer.shadowColor = UIColor.black.cgColor
        addIncomeButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        addIncomeButton.layer.cornerRadius = 7
        addIncomeButton.layer.shadowOpacity = 1
        addIncomeButton.translatesAutoresizingMaskIntoConstraints = false
        return addIncomeButton
    }()

    @objc func buttonPressed() {
        budgetManager.generateIncome(account: currentAccount, type: .salary, sum: 100, date: Date())
        print("Создан доход")
    }
    
    private func addConstraints() {
        view.addSubview(addIncomeButton)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(addIncomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50))
        constraints.append(addIncomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(addIncomeButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(addIncomeButton.widthAnchor.constraint(equalToConstant: 180))

        NSLayoutConstraint.activate(constraints)
    }
}

extension IncomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return accounts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath)
    // cell.accessoryType = .disclosureIndicator
    cell.textLabel?.text = accounts[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCell = tableView.cellForRow(at: indexPath)
    let selectedAccount = selectedCell?.textLabel?.text
    // NSUserDefaults
  }
}
