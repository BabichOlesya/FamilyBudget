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
    
	private var mainStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.distribution = .fill
		stackView.axis = .vertical
		stackView.spacing = 8.0
		return stackView
	}()
	
	private var textField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.isUserInteractionEnabled = true
		textField.layer.borderColor = UIColor.lightGray.cgColor
		textField.layer.borderWidth = 0.5
		textField.keyboardType = .alphabet
		textField.returnKeyType = .next
		return textField
	}()
	
	private var amountLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Сумма"
		return label
	}()
	
	private var confirmButton: UIButton = {
		let button = UIButton(type: .custom)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Сохранить", for: .normal)
		button.backgroundColor = .lightGray
		button.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		title = "Создать расход"
		textField.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		mainStackView.addArrangedSubview(amountLabel)
		mainStackView.addArrangedSubview(textField)
		mainStackView.addArrangedSubview(confirmButton)
		addConstraints()
	}
	
	private func addConstraints() {
			view.addSubview(mainStackView)
			NSLayoutConstraint.activate([
				mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
				mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
				mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
				//mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20.0)
					
			])
	}
	
	@objc private func saveChanges() {
		print(textField.text)
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
