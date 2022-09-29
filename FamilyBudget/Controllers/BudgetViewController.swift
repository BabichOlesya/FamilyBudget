//
//  BudgetViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class BudgetViewController: UIViewController {

  // MARK : Private API
    private var balance = TotalsView()
    private var income = TotalsView()
    private var cost =  TotalsView()
    private var budgetManager = BudgetManager()
  
    private enum Constant {
        static let diagramImageViewWidth: CGFloat = 180.0
        static let diagramImageViewHeight: CGFloat = 180.0
        static let lateralIndent: CGFloat = 20.0
        static let upperIndentS: CGFloat = 10.0
        static let upperIndentL: CGFloat = 30.0
        static let bottomIndentL: CGFloat = 50.0
        static let totalBudgetViewHeight: CGFloat = 240.0
        static let settingsBudgetViewHeight: CGFloat = 130.0
        
    }

  // MARK : Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "Бюджет"
      
		balance.nameTotal = "Перерасход/остаток"
		income.nameTotal = "Итого доходов"
		cost.nameTotal = "Итого расходов"
		
		income.amount = budgetManager.totalIncomes
		cost.amount = budgetManager.totalCosts
		balance.amount = budgetManager.balance
		
		view.addSubview(diagramImageView)
		view.addSubview(statusStackView)
		view.addSubview(labelStackView)
		statusStackView.addArrangedSubview(monthButton)
		statusStackView.addArrangedSubview(status)
		labelStackView.addArrangedSubview(balance)
		labelStackView.addArrangedSubview(income)
		labelStackView.addArrangedSubview(cost)
		addConstraints()

    let imageForSettings = UIImage(systemName: "circle.hexagonpath.fill")
    let buttonSettings = UIBarButtonItem(image: imageForSettings , style: .done, target: self, action: #selector(clickButtonSettings))
    navigationItem.leftBarButtonItem = buttonSettings
	}
    
    @objc func clickButtonSettings() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
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
        status.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
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
 
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 30
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()

  
    private func addConstraints() {

      NSLayoutConstraint.activate([
        
        diagramImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentS),
        diagramImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
        diagramImageView.heightAnchor.constraint(equalToConstant: Constant.diagramImageViewWidth),
        diagramImageView.widthAnchor.constraint(equalToConstant: Constant.diagramImageViewHeight),
        
        statusStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentL),
        statusStackView.leadingAnchor.constraint(equalTo: diagramImageView.trailingAnchor, constant: Constant.lateralIndent),
        statusStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
        statusStackView.heightAnchor.constraint(equalToConstant: Constant.settingsBudgetViewHeight),
        
        labelStackView.topAnchor.constraint(equalTo: diagramImageView.bottomAnchor, constant: Constant.bottomIndentL),
        labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
        labelStackView.heightAnchor.constraint(equalToConstant: Constant.totalBudgetViewHeight)
        
      ])
    }
}
