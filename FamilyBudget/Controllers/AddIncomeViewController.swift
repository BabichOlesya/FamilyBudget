//
//  AddIncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

public protocol IncomeData: NSObject {
  func saveData(account: BankAccount, type: IncomeType, amount: Double, date: Date, comment: String?)
}

class AddIncomeViewController: UIViewController, IncomeData {
    var currentAccount = BankAccount(name: "Сбер", currency: .rub)
    
    private let spinner = UIActivityIndicatorView()
    
    private enum Constant {
        static let lateralIndent: CGFloat = 20.0
        static let bottomIndentL: CGFloat = 80.0
        static let bottomHeight: CGFloat = 50.00
        static let buttonViewWidth: CGFloat = 180.0
        static let buttonViewHeight: CGFloat = 50.0
        static let upperIndentS: CGFloat = 10.0
        static let upperIndentL: CGFloat = 30.0
    }
    
    // MARK: Views
    private var addIncomeView: AddIncomeCostView = {
      let addIncomeView = AddIncomeCostView()
      addIncomeView.translatesAutoresizingMaskIntoConstraints = false
      addIncomeView.clipsToBounds = true
      addIncomeView.nameBankAccount = "Счет банка"
      addIncomeView.nameTypeIncomeCost = "Статья дохода"
      addIncomeView.nameLabelSum = "Сумма дохода"
      addIncomeView.nameLabelDate = "Дата дохода"
      addIncomeView.nameLabelComment = "Комментарий"
      addIncomeView.selectedAccountTitle = "Счета"
      addIncomeView.selectedTypeTitle = "Статьи"
      return addIncomeView
    }()
    
    private lazy var contentView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
  
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: Lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Create income"
        addIncomeView.incomeDataDelegate = self
        spinner.hidesWhenStopped = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
        
        addIncomeView.textFieldDate.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        contentView.addSubview(addIncomeView)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        view.addSubview(spinner)
        view.bringSubviewToFront(spinner)
        setupConstraints()
    }
    
    // MARK: Keyboard notifications
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        self.scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    @objc func tapDone() {
           if let datePicker = addIncomeView.textFieldDate.inputView as? UIDatePicker {
               let dateformatter = DateFormatter()
               dateformatter.dateFormat = "dd-MM-yyyy HH:mm"
//               dateformatter.dateStyle = .medium
               addIncomeView.textFieldDate.text = dateformatter.string(from: datePicker.date)
           }
        addIncomeView.textFieldDate.resignFirstResponder()
       }
       
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spinner.widthAnchor.constraint(equalToConstant: 24.0),
            spinner.heightAnchor.constraint(equalToConstant: 24.0),
            
            addIncomeView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            addIncomeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addIncomeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            addIncomeView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            addIncomeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.upperIndentS),
            
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
    
    // MARK: Actions
    func saveData(account: BankAccount, type: IncomeType, amount: Double, date: Date, comment: String?) {
      // CHECK DATA
      // SHOW PROGRES - UIActivityIndicatorView
      spinner.startAnimating()
      BudgetManager.shared.createIncome(account: account, type: type, amount: amount, date: date)
      spinner.stopAnimating()
    }
}

