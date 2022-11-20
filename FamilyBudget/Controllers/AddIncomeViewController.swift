//
//  AddIncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class AddIncomeViewController: UIViewController {
    
    // MARK : Private API
    private var addIncomeView = AddIncomeCostView()
    
//    private var budgetManager = BudgetManager()
    var currentAccount = BankAccount(name: "Сбер", currency: .rub)
    
    private enum Constant {
        static let lateralIndent: CGFloat = 20.0
        static let bottomIndentL: CGFloat = 80.0
        static let bottomHeight: CGFloat = 50
    }
    
    private var confirmButton: UIButton = {
        let confirmButton = UIButton(type: .custom)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle("Сохранить", for: .normal)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.layer.shadowColor = UIColor.black.cgColor
        confirmButton.layer.cornerRadius = 7
        confirmButton.layer.shadowOpacity = 1
        confirmButton.addTarget(AddCostViewController.self, action: #selector(saveChanges), for: .touchUpInside)
        return confirmButton
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.distribution = .fill
        mainStackView.axis = .vertical
        mainStackView.spacing = 8.0
        return mainStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Создать доход"
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard) )
        view.addGestureRecognizer(tapGesture)
        
        // view.addSubview(scrollView)
        // scrollView.addSubview(mainStackView)
        //mainStackView.addArrangedSubview(addIncomeView)
        //mainStackView.addArrangedSubview(confirmButton)
      
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //addIncomeView.addSubview(view)
    
    addIncomeView.translatesAutoresizingMaskIntoConstraints = false
    addIncomeView.clipsToBounds = true
    addIncomeView.nameBankAccount = "Счет банка"
    addIncomeView.nameTypeIncomeCost = "Статья дохода"
    addIncomeView.nameLabelSum = "Сумма дохода"
    addIncomeView.nameLabelDate = "Дата дохода"
    addIncomeView.nameLabelComment = "Комментарий"
    addIncomeView.selectionAccount = "Счета"
    addIncomeView.selectionType = "Статьи"
    
    view.addSubview(addIncomeView)
    view.addSubview(confirmButton)
    
    addConstraints()
  }
  
    @objc func hideKeyboard() {
        addIncomeView.endEditing(true)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            //            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            //            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            //            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
          addIncomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          // addIncomeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
          addIncomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          //addIncomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          addIncomeView.widthAnchor.constraint(equalTo: view.widthAnchor),
          addIncomeView.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -16.0),
            
            //            addCostView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            //            addCostView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            //            addCostView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
          confirmButton.topAnchor.constraint(equalTo: addIncomeView.bottomAnchor, constant: 16.0),
          confirmButton.heightAnchor.constraint(equalToConstant: 60),
          confirmButton.widthAnchor.constraint(equalToConstant: 200),
          confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160.0)
        ])
    }
    
    @objc private func saveChanges() {
        //        print(textField.text)
        print("Save")
    }
    
}
