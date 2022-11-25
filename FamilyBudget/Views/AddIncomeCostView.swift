//
//  AddIncomeCostView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 2.9.22..
//

import UIKit

class AddIncomeCostView: UIView, UITextFieldDelegate {

    @IBOutlet private weak var labelBankAccount: UILabel!
    @IBOutlet private weak var labelTypeIncomeCost: UILabel!
    @IBOutlet private weak var labelSum: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelComment: UILabel!
    @IBOutlet private weak var selectAccountButton: UIButton!
    @IBOutlet private weak var selectTypeButton: UIButton!
    @IBOutlet private weak var textFieldSum: UITextField!
    @IBOutlet private weak var textFieldDate: UITextField!
    @IBOutlet private weak var textViewComment: UITextView!
    @IBOutlet private weak var saveButton: UIButton!
 
    public weak var incomeDataDelegate: IncomeData?
    let datePicker = UIDatePicker()
    
    public var nameBankAccount: String? {
        didSet {
            labelBankAccount.text = nameBankAccount
        }
    }
    
    public var nameTypeIncomeCost: String? {
        didSet {
            labelTypeIncomeCost.text = nameTypeIncomeCost
        }
    }
    
    public var nameLabelSum: String? {
        didSet {
            labelSum.text = nameLabelSum
        }
    }
    
    public var nameLabelDate: String? {
        didSet {
            labelDate.text = nameLabelDate
        }
    }
    
    public var nameLabelComment: String? {
        didSet {
            labelComment.text = nameLabelComment
        }
    }
    
    public var selectedAccountTitle: String? {
        didSet {
          selectAccountButton.setTitle(selectedAccountTitle, for: .normal)
        }
    }
    
    public var selectedTypeTitle: String? {
        didSet {
          selectTypeButton.setTitle(selectedTypeTitle, for: .normal)
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeFromNib()
        textFieldDate.placeholder = Date().description
        textFieldDate.delegate = self
      
//      datePicker.isHidden = true
//
//
//        datePicker.datePickerMode = .date
//        let localeID = Locale.preferredLanguages.first
//        datePicker.locale = Locale(identifier: localeID!)
//
//        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeFromNib()
    }
  
    @objc func dateChange() {
        gatDateFromPiker()
    }
    
    func gatDateFromPiker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyy HH:mm"
        textFieldDate.text = formatter.string(from: datePicker.date)
    }
  
    @IBAction func saveData() {
      let account = BankAccount(name: "Sber", currency: .eur)
      let amount = 10.0
      let comment = textViewComment.text
      incomeDataDelegate?.saveData(account: account, type: .business, amount: amount, date: Date(), comment: comment)
    }
  
    //MARK: TextField Delegate
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      saveData()
      return true
    }
}
