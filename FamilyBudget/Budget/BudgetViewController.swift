//
//  BudgetViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class BudgetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraints()
    }
    
    lazy var diagramImageView: UIImageView = {
        let diagramImage = UIImage(named: "diag")
        let diagramImageView = UIImageView(image: diagramImage)
        diagramImageView.contentMode = .scaleAspectFit
        diagramImageView.layer.masksToBounds = true
        diagramImageView.translatesAutoresizingMaskIntoConstraints = false
        return diagramImageView
    }()
    
    private lazy var status: UILabel = {
        let status = UILabel()
        status.text = "Статус выполнения бюджета"
        status.font = .systemFont(ofSize: 16, weight: .bold)
        status.textColor = .systemGray
        status.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        status.numberOfLines = 3
        status.textAlignment = .center
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var monthButton: UIButton = {
        let monthButton = UIButton()
        monthButton.setTitle("Месяц", for: .normal)
        monthButton.backgroundColor = .systemGray2
        monthButton.layer.shadowColor = UIColor.black.cgColor
        monthButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        monthButton.layer.cornerRadius = 7
        monthButton.layer.shadowOpacity = 1
        monthButton.translatesAutoresizingMaskIntoConstraints = false
        return monthButton
    }()
    
    private lazy var statusStackView: UIStackView = {
        let statusStackView = UIStackView()
        statusStackView.axis = .vertical
        statusStackView.distribution = .equalSpacing
        statusStackView.spacing = 30
        statusStackView.translatesAutoresizingMaskIntoConstraints = false
        return statusStackView
    }()
    
    private lazy var balance: UILabel = {
        let balance = UILabel()
        balance.text = "Перерасход/остаток бюджета"
        balance.font = .systemFont(ofSize: 18, weight: .regular)
        balance.textColor = .systemGray
        balance.numberOfLines = 2
        balance.layer.borderWidth = 0.5
        balance.layer.cornerRadius = 12.0
        balance.translatesAutoresizingMaskIntoConstraints = false
        return balance
    }()
    
    private lazy var totalIncome: UILabel = {
        let totalIncome = UILabel()
        totalIncome.text = "Всего доходов"
        totalIncome.font = .systemFont(ofSize: 18, weight: .regular)
        totalIncome.textColor = .systemGray
        totalIncome.numberOfLines = 2
        totalIncome.layer.borderWidth = 0.5
        totalIncome.layer.cornerRadius = 12.0
        totalIncome.translatesAutoresizingMaskIntoConstraints = false
        return totalIncome
    }()
    
    private lazy var totalExpenses: UILabel = {
        let totalExpenses = UILabel()
        totalExpenses.text = "Всего расходов"
        totalExpenses.font = .systemFont(ofSize: 18, weight: .regular)
        totalExpenses.textColor = .systemGray
        totalExpenses.numberOfLines = 2
        totalExpenses.layer.borderWidth = 0.5
        totalExpenses.layer.cornerRadius = 12.0
        totalExpenses.translatesAutoresizingMaskIntoConstraints = false
        return totalExpenses
    }()
    
    private lazy var balanceAmount: UILabel = {
        let balanceAmount = UILabel()
        balanceAmount.font = .systemFont(ofSize: 18, weight: .regular)
        balanceAmount.textColor = .systemGray
        balanceAmount.layer.borderWidth = 0.5
        balanceAmount.layer.cornerRadius = 12.0
        balanceAmount.backgroundColor = .systemGray6
        balanceAmount.textAlignment = .right
        balanceAmount.text = "0"
        balanceAmount.translatesAutoresizingMaskIntoConstraints = false
        return balanceAmount
    }()
    
    private lazy var amountIncome: UILabel = {
        let amountIncome = UILabel()
        amountIncome.font = .systemFont(ofSize: 18, weight: .regular)
        amountIncome.textColor = .systemGray
        amountIncome.layer.borderWidth = 0.5
        amountIncome.layer.cornerRadius = 12.0
        amountIncome.backgroundColor = .systemGray6
        amountIncome.textAlignment = .right
        amountIncome.text = "0"
        amountIncome.translatesAutoresizingMaskIntoConstraints = false
        return amountIncome
    }()
    
    private lazy var amountExpenses: UILabel = {
        let amountExpenses = UILabel()
        amountExpenses.font = .systemFont(ofSize: 18, weight: .regular)
        amountExpenses.textColor = .systemGray
        amountExpenses.layer.borderWidth = 0.5
        amountExpenses.layer.cornerRadius = 12.0
        amountExpenses.backgroundColor = .systemGray6
        amountExpenses.textAlignment = .right
        amountExpenses.text = "0"
        amountExpenses.translatesAutoresizingMaskIntoConstraints = false
        return amountExpenses
    }()
    
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 30
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()
    
    private lazy var amountStackView: UIStackView = {
        let amountStackView = UIStackView()
        amountStackView.axis = .vertical
        amountStackView.distribution = .fillEqually
        amountStackView.spacing = 30
        amountStackView.translatesAutoresizingMaskIntoConstraints = false
        return amountStackView
    }()
    

    private func addConstraints() {
        
        view.addSubview(diagramImageView)
        view.addSubview(statusStackView)
        view.addSubview(labelStackView)
        view.addSubview(amountStackView)
        statusStackView.addArrangedSubview(monthButton)
        statusStackView.addArrangedSubview(status)
        labelStackView.addArrangedSubview(balance)
        labelStackView.addArrangedSubview(totalIncome)
        labelStackView.addArrangedSubview(totalExpenses)
        amountStackView.addArrangedSubview(balanceAmount)
        amountStackView.addArrangedSubview(amountIncome)
        amountStackView.addArrangedSubview(amountExpenses)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(diagramImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(diagramImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(diagramImageView.heightAnchor.constraint(equalToConstant: 180))
        constraints.append(diagramImageView.widthAnchor.constraint(equalToConstant: 180))

        constraints.append(statusStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30))
        constraints.append(statusStackView.leadingAnchor.constraint(equalTo: diagramImageView.trailingAnchor, constant: 20))
        constraints.append(statusStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(statusStackView.heightAnchor.constraint(equalToConstant: 130))
        
        constraints.append(labelStackView.topAnchor.constraint(equalTo: diagramImageView.bottomAnchor, constant: 50))
        constraints.append(labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(labelStackView.heightAnchor.constraint(equalToConstant: 240))
        constraints.append(labelStackView.widthAnchor.constraint(equalToConstant: 240))

        constraints.append(amountStackView.topAnchor.constraint(equalTo: labelStackView.topAnchor))
        constraints.append(amountStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(amountStackView.heightAnchor.constraint(equalToConstant: 240))
        constraints.append(amountStackView.widthAnchor.constraint(equalToConstant: 120))


        NSLayoutConstraint.activate(constraints)
    }

}
