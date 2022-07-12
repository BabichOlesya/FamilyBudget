//
//  IncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class IncomeViewController: UIViewController {
    
    var budgetManager = BudgetManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
    

    var countSber = Account(name: "Сбер", currency: .rub, balance: 0)
    
    @objc func buttonPressed() {
        budgetManager.generateIncome(account: countSber, type: .salary, sum: 100, date: Date.now)
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
