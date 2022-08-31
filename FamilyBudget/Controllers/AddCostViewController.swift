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
        
        view.addSubview(addCostView)
        addConstraints()
    }
    
    lazy var addCostView: UIView = {
        let addCostView = AddIncomeCostView()
        addCostView.translatesAutoresizingMaskIntoConstraints = false
        return addCostView
    }()

    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            addCostView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentXL),
            addCostView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
            addCostView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
            addCostView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL)
            
        ])
    }
    
}
