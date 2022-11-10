//
//  AddIncomeCostView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 2.9.22..
//

import UIKit

class AddIncomeCostView: UIView {

    @IBOutlet private weak var labelBankAccount: UILabel!
    @IBOutlet private weak var labelTypeIncomeCost: UILabel!
    @IBOutlet private weak var labelSum: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelComment: UILabel!
    @IBOutlet private weak var labelSelectionAccount: UILabel!
    @IBOutlet private weak var labelSelectionType: UILabel!
    @IBOutlet private weak var textFieldSum: UITextField!
    @IBOutlet private weak var textFieldDate: UITextField!
    @IBOutlet private weak var textViewComment: UITextView!
    
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
    
    public var selectionAccount: String? {
        didSet {
            labelSelectionAccount.text = selectionAccount
        }
    }
    
    public var selectionType: String? {
        didSet {
            labelSelectionType.text = selectionType
        }
    }
    
    public var textFieldSumAdd: String? {
        didSet {
            textFieldSum.text = textFieldSumAdd
        }
    }
    
    public var textFieldDateAdd: String? {
        didSet {
            textFieldDate.text = textFieldDateAdd
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeFromNib()
        
        textFieldDate.inputView = datePicker
        datePicker.datePickerMode = .date
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
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
}
