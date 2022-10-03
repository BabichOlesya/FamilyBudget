//
//  AddIncomeCostView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 18.8.22..
//

import UIKit

class IncomeCostView: UIView {
    
    @IBOutlet private weak var labelAccount: UILabel!
    @IBOutlet private weak var labelIncomeCostType: UILabel!
    @IBOutlet private weak var labelSum: UILabel!
    
    @IBOutlet private weak var labelSelectionAccount: UILabel!
    @IBOutlet private weak var labelSelectionType: UILabel!
    @IBOutlet private weak var labelSumValue: UILabel!
    
    public var nameLabelAccount: String? {
        didSet {
            labelAccount.text = nameLabelAccount
        }
    }
    
    public var nameLabelTypeIncomeCost: String? {
        didSet {
            labelIncomeCostType.text = nameLabelTypeIncomeCost
        }
    }
    
    public var nameLabelSum: String? {
        didSet {
            labelSum.text = nameLabelSum
        }
    }
    
    
    public var account: BankAccount? {
        didSet {
            labelSelectionAccount.text = account?.name
        }
    }

    public var incomeType: IncomeType? {
        didSet {
            labelSelectionType.text = incomeType?.rawValue
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

}
