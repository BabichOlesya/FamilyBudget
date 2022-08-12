//
//  TotalsView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 27.7.22..
//

import UIKit



class TotalsView: UIView {
    
   
    @IBOutlet private weak var labelAmount: UILabel!
    
    @IBOutlet private weak var labelTotal: UILabel!
    
    public var total: String? {
        didSet {
            labelTotal.text = total
        }
    }

    public var amount: String? {
        didSet {
            labelAmount.text = amount
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



