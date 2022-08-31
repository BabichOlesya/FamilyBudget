//
//  AddIncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class AddIncomeViewController: UIViewController {
    
    // MARK : Private API
    private var addIncome = AddIncomeCostView()
    private var budgetManager = BudgetManager()
    var currentAccount = BankAccount(name: "Сбер", currency: .rub, balance: 0)
    
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
        title = "Создать доход"
        
        view.addSubview(addIncomeView)
        addConstraints()
    }
    
    private lazy var addIncomeView: UIView = {
        let addIncomeView = AddIncomeCostView()
        addIncomeView.translatesAutoresizingMaskIntoConstraints = false
        return addIncomeView
    }()
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            addIncomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentXL),
            addIncomeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
            addIncomeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
            addIncomeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL)
            
        ])
    }
    
}
