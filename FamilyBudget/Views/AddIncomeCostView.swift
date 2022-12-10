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
    @IBOutlet private(set) weak var amountTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet private weak var textViewComment: UITextView!
    @IBOutlet private weak var saveButton: UIButton!
 
    public weak var incomeDataDelegate: IncomeData?
    
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
        dateTextField.placeholder = Date().description
        dateTextField.delegate = self
      
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeFromNib()
    }
  
    @IBAction func saveData() {
      let account = BankAccount(name: "Sber", currency: .eur)
      let amount = Double(amountTextField.text ?? "0") ?? 0
      let comment = textViewComment.text
      incomeDataDelegate?.saveData(account: account, type: .business, amount: amount, date: Date(), comment: comment)
    }
  
    //MARK: TextField Delegate
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      saveData()
      return true
    }
}
