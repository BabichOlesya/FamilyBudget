//
//  AddCostViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class AddCostViewController: UIViewController {
    
	// MARK : Private API
    private var addCostView = AddIncomeCostView()
    
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
        title = "Создать расход"

        addCostView.nameBankAccount = "Счет банка"
        addCostView.nameTypeIncomeCost = "Статья расхода"
        addCostView.nameLabelSum = "Сумма расхода"
        addCostView.nameLabelDate = "Дата расхода"
        addCostView.nameLabelComment = "Комментарий"
        addCostView.selectedAccountTitle = "Счета"
        addCostView.selectedTypeTitle = "Статьи"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard) )
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      // view.addSubview(scrollView)
      // scrollView.addSubview(mainStackView)
      mainStackView.addArrangedSubview(addCostView)
      mainStackView.addArrangedSubview(confirmButton)
      view.addSubview(mainStackView)
      addConstraints()
    }
    
    @objc func hideKeyboard() {
        addCostView.endEditing(true)
    }
    
   
    private func addConstraints() {
        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
//            addCostView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
//            addCostView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
//            addCostView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
            confirmButton.widthAnchor.constraint(equalToConstant: 120),
            confirmButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -16.0)
        ])
    }
  // override var intrinsicContentSize {
  /// ... |
    @objc private func saveChanges() {
        //		print(textField.text)
        print("Save")
    }
}

extension AddCostViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Start")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text
        print(text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let array = ["a", "b", "c"]
        return array.contains(string)
    }
}
