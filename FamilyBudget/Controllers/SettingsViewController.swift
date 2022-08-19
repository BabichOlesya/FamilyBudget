//
//  SettingsViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 30.6.22..
//

import UIKit

class SettingsViewController: UIViewController {
    
    private enum Constant {
        static let lateralIndent: CGFloat = 20.0
        static let upperIndentS: CGFloat = 10.0
        static let upperIndentL: CGFloat = 30.0
        static let bottomIndentL: CGFloat = 50.0
        static let settingsBudgetViewWidthL: CGFloat = 240.0
        static let settingsBudgetViewWidthS: CGFloat = 120.0
        static let settingsBudgetViewHeight: CGFloat = 180.0
        static let spacing: CGFloat = 30
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(labelStackView)
        view.addSubview(amountStackView)
        labelStackView.addArrangedSubview(mainCurrency)
        labelStackView.addArrangedSubview(incomeAccounting)
        labelStackView.addArrangedSubview(costAccounting)
        amountStackView.addArrangedSubview(currancyButton)
        amountStackView.addArrangedSubview(incomeSwitch)
        amountStackView.addArrangedSubview(incomeSwitch)
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
    
    private var costSwitch: UISwitch {
        let costSwitch = UISwitch()
        return costSwitch
    }
    
    private var incomeSwitch: UISwitch {
        let incomeSwitch = UISwitch()
        return incomeSwitch
    }
    
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = Constant.spacing
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()
    
    private lazy var amountStackView: UIStackView = {
        let amountStackView = UIStackView()
        amountStackView.axis = .vertical
        amountStackView.distribution = .fillEqually
        amountStackView.spacing = Constant.spacing
        amountStackView.translatesAutoresizingMaskIntoConstraints = false
        return amountStackView
    }()
    
    private func addConstraints() {

      NSLayoutConstraint.activate([
        
        labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentL),
        labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
        labelStackView.heightAnchor.constraint(equalToConstant: Constant.settingsBudgetViewHeight),
        labelStackView.widthAnchor.constraint(equalToConstant: Constant.settingsBudgetViewWidthL),

        amountStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentL),
        amountStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
        amountStackView.heightAnchor.constraint(equalToConstant: Constant.settingsBudgetViewHeight),
        amountStackView.widthAnchor.constraint(equalToConstant: Constant.settingsBudgetViewWidthS)
        
      ])
    }
}
