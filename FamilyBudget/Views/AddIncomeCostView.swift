//
//  AddIncomeCostView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 18.8.22..
//

import UIKit

class AddIncomeCostView: UIView {
    
    @IBOutlet private weak var labelAccount: UILabel!
    @IBOutlet private weak var labelItem: UILabel!
    @IBOutlet private weak var labelSum: UILabel!
    @IBOutlet private weak var labelSelectionAccount: UILabel!
    @IBOutlet private weak var labelSelectionItems: UILabel!
    @IBOutlet private weak var textfieldSum: UITextField!
    
    public var account: String? {
        didSet {
            labelAccount.text = account
        }
    }

    public var item: String? {
        didSet {
            labelItem.text = item
        }
    }
    
    public var sum: String? {
        didSet {
            labelSum.text = sum
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
