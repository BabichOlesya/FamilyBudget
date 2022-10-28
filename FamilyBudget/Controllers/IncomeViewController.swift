//
//  IncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class IncomeViewController: UIViewController {
    
    var currentAccount = BankAccount(name: "Сбер", currency: .rub)
    private let cellIdentifier = "IncomeCell"
    
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
        
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(addIncomeButton)
        addConstraints()
        
        BudgetManager.shared.createIncome(account: currentAccount, type: .salary, sum: 100, date: Date())
        BudgetManager.shared.createIncome(account: currentAccount, type: .investments, sum: 2000, date: Date())
        incomes = BudgetManager.shared.fetchIncomes() ?? []
        tableView.reloadData()
    }
    
    private lazy var addIncomeButton: UIButton = {
        let addIncomeButton = UIButton()
        addIncomeButton.setTitle("Добавить", for: .normal)
        addIncomeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addIncomeButton.backgroundColor = .systemBlue
        addIncomeButton.layer.shadowColor = UIColor.black.cgColor
        addIncomeButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        addIncomeButton.layer.cornerRadius = 7
        addIncomeButton.layer.shadowOpacity = 1
        addIncomeButton.translatesAutoresizingMaskIntoConstraints = false
        return addIncomeButton
    }()

    @objc func buttonPressed() {
        let viewController = AddIncomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
//        budgetManager.createIncome(account: currentAccount, type: .salary, sum: 100, date: Date())
//        print("Создан доход")
    }
    
    
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            addIncomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL),
            addIncomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addIncomeButton.heightAnchor.constraint(equalToConstant: Constant.buttonViewHeight),
            addIncomeButton.widthAnchor.constraint(equalToConstant: Constant.buttonViewWidth)
            
        ])
    }
    
}

extension IncomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return incomes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! InfoTableViewCell
      cell.income = incomes[indexPath.row]
      return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let selectedCell = tableView.cellForRow(at: indexPath) as! InfoTableViewCell
      let selectedItem = selectedCell.income
      let infoController = InfoViewController()
      infoController.currentIncome = selectedItem
      navigationController?.pushViewController(infoController, animated: true)
  }
}
