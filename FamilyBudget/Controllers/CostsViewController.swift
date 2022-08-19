//
//  CostViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 18.7.22..
//

import UIKit

class CostsViewController: UIViewController {

    var budgetManager = BudgetManager()
    var countSber = Account(name: "Сбер", currency: .rub, balance: 0)
    
    @IBOutlet weak var tableView: UITableView!
    var costs = ["Cost1", "Cost2", "Cost3", "Cost4"]
    
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
        title = "Расходы"
        
        view.addSubview(addCostButton)
        addConstraints()
    }

    private lazy var addCostButton: UIButton = {
        let addCostButton = UIButton()
        addCostButton.setTitle("Добавить", for: .normal)
        addCostButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addCostButton.backgroundColor = .systemGray2
        addCostButton.layer.shadowColor = UIColor.black.cgColor
        addCostButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        addCostButton.layer.cornerRadius = 7
        addCostButton.layer.shadowOpacity = 1
        addCostButton.translatesAutoresizingMaskIntoConstraints = false
        return addCostButton
    }()
    
    
    @objc func buttonPressed() {
//        budgetManager.generateCost(account: countSber, type: .alcohol, sum: 100, date: Date.now)
        print("Создан расход")
        
    }
    
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
          addCostButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL),
          addCostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          addCostButton.heightAnchor.constraint(equalToConstant: Constant.buttonViewHeight),
          addCostButton.widthAnchor.constraint(equalToConstant: Constant.buttonViewWidth)
      ])

    }

}
extension CostsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return costs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CostCell", for: indexPath)
     cell.accessoryType = .disclosureIndicator
    cell.textLabel?.text = costs[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCell = tableView.cellForRow(at: indexPath)
    let selectedAccount = selectedCell?.textLabel?.text
    // NSUserDefaults
  }
    
}
