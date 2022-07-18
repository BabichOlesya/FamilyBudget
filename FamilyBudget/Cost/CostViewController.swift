//
//  CostViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 18.7.22..
//

import UIKit

class CostViewController: UIViewController {

    var budgetManager = BudgetManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "Расходы"
        var tabBarItem = UITabBarItem()
        self.tabBarItem = UITabBarItem(title: "Расходы", image: UIImage(systemName: "minus.circle.fill"), tag: 2)
        
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
    

    var countSber = Account(name: "Сбер", currency: .rub, balance: 0)
    
    @objc func buttonPressed() {
        budgetManager.generateCost(account: countSber, type: .alcohol, sum: 100, date: Date.now)
        print("Создан расход")
        
    }
    
    
    private func addConstraints() {
        
        view.addSubview(addCostButton)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(addCostButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50))
        constraints.append(addCostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(addCostButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(addCostButton.widthAnchor.constraint(equalToConstant: 180))



        NSLayoutConstraint.activate(constraints)
    }

}
