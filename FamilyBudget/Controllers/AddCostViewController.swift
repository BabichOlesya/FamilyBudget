//
//  AddCostViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class AddCostViewController: UIViewController {
    
    // MARK : Private API
    private var addCost = AddIncomeCostView()
    private var budgetManager = BudgetManager()
    var countSber = BankAccount(name: "Сбер", currency: .rub, balance: 0)
    
    private enum Constant {
        static let lateralIndent: CGFloat = 20.0
        static let upperIndentS: CGFloat = 10.0
        static let upperIndentL: CGFloat = 30.0
        static let upperIndentXL: CGFloat = 50.0
        static let bottomIndentS: CGFloat = 10.0
        static let bottomIndentL: CGFloat = 50.0
        static let spacing: CGFloat = 30
        static let buttonViewWidth: CGFloat = 180.0
        static let buttonViewHeight: CGFloat = 50.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Создать расход"
        
        view.addSubview(stackView)
        stackView.addSubview(addCostView)
        stackView.addSubview(addCostButton)
        addConstraints()
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var addCostView: UIView = {
        let addCostView = AddIncomeCostView()
        addCostView.translatesAutoresizingMaskIntoConstraints = false
        return addCostView
    }()
    
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
        budgetManager.createCost(account: countSber, type: .alcohol, sum: 100, date: Date())
        print("Создан расход")
        
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentXL),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL),
            addCostView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: Constant.upperIndentL),
            addCostButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -Constant.bottomIndentS),
            addCostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addCostButton.heightAnchor.constraint(equalToConstant: Constant.buttonViewHeight),
            addCostButton.widthAnchor.constraint(equalToConstant: Constant.buttonViewWidth)
            
        ])
    }
    
}
