//
//  AddCostViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class AddCostViewController: UIViewController {
    
	// MARK : Private API
	private var budgetManager = BudgetManager()
    private var addCost = AddIncomeCostView()
	
//	private var textField: UITextField = {
//		let textField = UITextField()
//		textField.translatesAutoresizingMaskIntoConstraints = false
//		textField.isUserInteractionEnabled = true
//		textField.layer.borderColor = UIColor.lightGray.cgColor
//		textField.layer.borderWidth = 0.5
//		textField.keyboardType = .alphabet
//		textField.returnKeyType = .next
//		return textField
//	}()
//
//	private var amountLabel: UILabel = {
//		let label = UILabel()
//		label.translatesAutoresizingMaskIntoConstraints = false
//		label.text = "Сумма"
//		return label
//	}()
//
	private var confirmButton: UIButton = {
		let confirmButton = UIButton(type: .custom)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle("Сохранить", for: .normal)
        confirmButton.backgroundColor = .lightGray
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
		title = "Создать расход"
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(addCost)
        mainStackView.addArrangedSubview(confirmButton)
        addConstraints()
//		textField.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
//		mainStackView.addArrangedSubview(amountLabel)
//		mainStackView.addArrangedSubview(textField)

		
	}
	
	private func addConstraints() {
			NSLayoutConstraint.activate([
				mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5.0),
				mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5.0),
				mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5.0),
                mainStackView.heightAnchor.constraint(equalToConstant: 600.0),
                addCost.topAnchor.constraint(equalTo: mainStackView.topAnchor),
//                addCost.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
                addCost.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
                addCost.heightAnchor.constraint(equalToConstant: 520.0),
                addCost.widthAnchor.constraint(equalToConstant: 370.0),
                confirmButton.topAnchor.constraint(equalTo: addCost.bottomAnchor),
                confirmButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
                confirmButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
                confirmButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
//				mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20.0)
					
			])
	}
	
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
