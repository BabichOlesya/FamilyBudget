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
    private var contentView = UIView(frame: .zero)
  
    var currentAccount = BankAccount(name: "Сбер", currency: .rub)
    
    private enum Constant {
        static let lateralIndent: CGFloat = 20.0
        static let bottomIndentL: CGFloat = 80.0
        static let bottomHeight: CGFloat = 50.00
        static let buttonViewWidth: CGFloat = 180.0
        static let buttonViewHeight: CGFloat = 50.0
        static let upperIndentS: CGFloat = 10.0
        static let upperIndentL: CGFloat = 30.0
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Create income"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard) )
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addIncomeView)
        contentView.addSubview(confirmButton)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
//        scrollView.addSubview(datePicker)
        
        addConstraints()
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setup() {
        addIncomeView.translatesAutoresizingMaskIntoConstraints = false
        addIncomeView.clipsToBounds = true
        addIncomeView.nameBankAccount = "Счет банка"
        addIncomeView.nameTypeIncomeCost = "Статья дохода"
        addIncomeView.nameLabelSum = "Сумма дохода"
        addIncomeView.nameLabelDate = "Дата дохода"
        addIncomeView.nameLabelComment = "Комментарий"
        addIncomeView.selectionAccount = "Счета"
        addIncomeView.selectionType = "Статьи"
    }
    
    @objc func keyboardWasShown(notification: Notification) {
//        let info = notification.userInfo! as NSDictionary
//        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
//        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
//
//        self.scrollView.contentInset = contentInsets
//        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
//        let contentInsets = UIEdgeInsets.zero
//        scrollView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            addIncomeView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            addIncomeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addIncomeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            addIncomeView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            addIncomeView.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -Constant.upperIndentS),

            confirmButton.topAnchor.constraint(equalTo: addIncomeView.bottomAnchor, constant: Constant.upperIndentS),
            confirmButton.heightAnchor.constraint(equalToConstant: Constant.buttonViewHeight),
            confirmButton.widthAnchor.constraint(equalToConstant: Constant.buttonViewWidth),
            confirmButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc private func saveChanges() {
        print("Save")
    }
    
}

