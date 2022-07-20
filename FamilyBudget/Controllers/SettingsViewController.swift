//
//  SettingsViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 30.6.22..
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraints()
    }
    
    private lazy var mainCurrency: UILabel = {
        let mainCurrency = UILabel()
        mainCurrency.text = "Основная валюта"
        mainCurrency.font = .systemFont(ofSize: 18, weight: .regular)
        mainCurrency.textColor = .systemGray
        mainCurrency.numberOfLines = 2
        mainCurrency.layer.borderWidth = 0.5
        mainCurrency.layer.cornerRadius = 12.0
        mainCurrency.translatesAutoresizingMaskIntoConstraints = false
        return mainCurrency
    }()
    
    private lazy var costAccounting: UILabel = {
        let costAccounting = UILabel()
        costAccounting.text = "Учет расходов"
        costAccounting.font = .systemFont(ofSize: 18, weight: .regular)
        costAccounting.textColor = .systemGray
        costAccounting.numberOfLines = 2
        costAccounting.layer.borderWidth = 0.5
        costAccounting.layer.cornerRadius = 12.0
        costAccounting.translatesAutoresizingMaskIntoConstraints = false
        return costAccounting
    }()
    
    private lazy var incomeAccounting: UILabel = {
        let  incomeAccounting = UILabel()
        incomeAccounting.text = "Учет доходов"
        incomeAccounting.font = .systemFont(ofSize: 18, weight: .regular)
        incomeAccounting.textColor = .systemGray
        incomeAccounting.numberOfLines = 2
        incomeAccounting.layer.borderWidth = 0.5
        incomeAccounting.layer.cornerRadius = 12.0
        incomeAccounting.translatesAutoresizingMaskIntoConstraints = false
        return incomeAccounting
    }()
    
    private lazy var currancyButton: UIButton = {
        let currancyButton = UIButton()
        currancyButton.setTitle("Валюта", for: .normal)
        currancyButton.backgroundColor = .systemGray2
        currancyButton.layer.shadowColor = UIColor.black.cgColor
        currancyButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        currancyButton.layer.cornerRadius = 7
        currancyButton.layer.shadowOpacity = 1
        currancyButton.translatesAutoresizingMaskIntoConstraints = false
        return currancyButton
    }()
    
    private var costClider: UISlider {
        let costClider = UISlider()
        return costClider
    }
    
    private var incomeClider: UISlider {
        let incomeClider = UISlider()
        return incomeClider
    }
    
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
        
        view.addSubview(labelStackView)
        view.addSubview(amountStackView)
        labelStackView.addArrangedSubview(mainCurrency)
        labelStackView.addArrangedSubview(incomeAccounting)
        labelStackView.addArrangedSubview(costAccounting)
        amountStackView.addArrangedSubview(currancyButton)
        amountStackView.addArrangedSubview(incomeClider)
        amountStackView.addArrangedSubview(costClider)

        var constraints = [NSLayoutConstraint]()
        
        
        constraints.append(labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30))
        constraints.append(labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(labelStackView.heightAnchor.constraint(equalToConstant: 180))
        constraints.append(labelStackView.widthAnchor.constraint(equalToConstant: 240))

        constraints.append(amountStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30))
        constraints.append(amountStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(amountStackView.heightAnchor.constraint(equalToConstant: 180))
        constraints.append(amountStackView.widthAnchor.constraint(equalToConstant: 120))


        NSLayoutConstraint.activate(constraints)
    }
    
}
