//
//  AddIncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class InfoViewController: UIViewController {
    
    public var currentIncome: Income?
    
    // MARK : Private API
    private var incomeInfoView = IncomeCostView()
    private var budgetManager = BudgetManager()
    var currentAccount = BankAccount(name: "Сбер", currency: .rub)
    
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
        title = "Информация"
//        
//        var items = navigationItem.rightBarButtonItems
//        if items == nil {
//            items = [UIBarButtonItem]()
//        }
//        items! += [ editButtonItem ]
//        navigationItem.rightBarButtonItems = items
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editIncome))
        
        incomeInfoView.nameLabelAccount = "Счет"
        incomeInfoView.nameLabelTypeIncomeCost = "Статья"
        incomeInfoView.nameLabelSum = "Сумма"
        
        view.addSubview(labelStackView)
        labelStackView.addArrangedSubview(incomeInfoView)
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        incomeInfoView.selectedAccountTitle = currentIncome?.account.name
        incomeInfoView.selectedTypeTitle = currentIncome?.type.rawValue.description
        incomeInfoView.sum = currentIncome?.amount
    }
    
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = Constant.spacing
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()
    
    @objc func editIncome() {
        
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentXL),
            labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
            labelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
            labelStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL)
        ])
    }
    
}
