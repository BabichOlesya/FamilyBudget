//
//  AddIncomeCostView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 18.8.22..
//

import UIKit

class IncomeCostView: UIView {
    
    @IBOutlet private weak var labelAccount: UILabel!
    @IBOutlet private weak var labelItem: UILabel!
    @IBOutlet private weak var labelSum: UILabel!
    
    @IBOutlet private weak var labelSelectionAccount: UILabel!
    @IBOutlet private weak var labelSelectionItems: UILabel!
    @IBOutlet private weak var labelSumValue: UILabel!
    
    public var account: BankAccount? {
        didSet {
            labelSelectionAccount.text = account?.name
        }
    }

    public var incomeType: IncomeType? {
        didSet {
            labelSelectionItems.text = incomeType?.rawValue
        }
    }
    
    public var sum: Double? {
        didSet {
            labelSumValue.text = "\(sum ?? 0)"
        }
    }
    
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      initializeFromNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeFromNib()
    }
//    
//    lazy var textfieldSumv: UITextField = {
//        let textfieldSum = UITextField()
//        textfieldSum.placeholder = "Введите сумму"
//        textfieldSum.adjustsFontSizeToFitWidth = true
//        textfieldSum.minimumFontSize = 0.5
//        textfieldSum.returnKeyType = .done
//        textfieldSum.textColor = .systemGray4
//        textfieldSum.borderStyle = .none
//        textfieldSum.returnKeyType = .next
//        textfieldSum.keyboardType = .default
//        textfieldSum.clearButtonMode = .always
//        textfieldSum.layer.cornerRadius = 7
//        textfieldSum.translatesAutoresizingMaskIntoConstraints = false
//        return textfieldSumv
//    }()


}
