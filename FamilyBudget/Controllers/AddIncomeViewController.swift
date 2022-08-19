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
    var currentAccount = Account(name: "Сбер", currency: .rub, balance: 0)
    
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
        
        view.addSubview(stackView)
        stackView.addSubview(addIncomeView)
        stackView.addSubview(addIncomeButton)
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
    
    private lazy var addIncomeView: UIView = {
        let addIncomeView = AddIncomeCostView()
        addIncomeView.translatesAutoresizingMaskIntoConstraints = false
        return addIncomeView
    }()
    
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
        
        NSLayoutConstraint.activate([
            
            
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentXL),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL),
            addIncomeView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: Constant.upperIndentL),
            addIncomeButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -Constant.bottomIndentS),
            addIncomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addIncomeButton.heightAnchor.constraint(equalToConstant: Constant.buttonViewHeight),
            addIncomeButton.widthAnchor.constraint(equalToConstant: Constant.buttonViewWidth)
            
        ])
    }
    
}
