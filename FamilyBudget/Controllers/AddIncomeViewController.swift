//
//  AddIncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 4.10.22..
//

import UIKit

class AddIncomeViewController: UIViewController {

    // MARK : Private API
    private var budgetManager = BudgetManager()
    private var addIncome = AddIncomeCostView()
    
    private enum Constant {
        static let lateralIndent: CGFloat = 20.0
        static let bottomIndentL: CGFloat = 80.0
        static let bottomHeight: CGFloat = 50
    }


    private var confirmButton: UIButton = {
        let confirmButton = UIButton(type: .custom)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle("Сохранить", for: .normal)
        confirmButton.backgroundColor = .systemGray2
        confirmButton.layer.shadowColor = UIColor.black.cgColor
        confirmButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        confirmButton.layer.cornerRadius = 7
        confirmButton.layer.shadowOpacity = 1
        confirmButton.addTarget(AddCostViewController.self, action: #selector(saveChanges), for: .touchUpInside)
        return confirmButton
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
        
        addIncome.nameBankAccount = "Счет банка"
        addIncome.nameTypeIncomeCost = "Статья дохода"
        addIncome.nameLabelSum = "Сумма дохода"
        addIncome.nameLabelDate = "Дата дохода"
        addIncome.nameLabelComment = "Комментарий"
        addIncome.selectionAccount = "Счета"
        addIncome.selectionType = "Статьи"
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(addIncome)
        mainStackView.addArrangedSubview(confirmButton)
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func addConstraints() {
            NSLayoutConstraint.activate([
                mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.lateralIndent),
                mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
                mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.lateralIndent),
                mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.lateralIndent),
                addIncome.topAnchor.constraint(equalTo: mainStackView.topAnchor),
                addIncome.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
                addIncome.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
                confirmButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.bottomIndentL),
                confirmButton.heightAnchor.constraint(equalToConstant: Constant.bottomHeight),
                confirmButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                confirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.bottomIndentL)
            ])
    }
    
    @objc private func saveChanges() {
//        print(textField.text)
        print("Save")
    }
}

//extension AddCostViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("Start")
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let text = textField.text
//        print(text)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        let text = textField.text
//        return true
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let array = ["a", "b", "c"]
//        return array.contains(string)
//    }
//}
