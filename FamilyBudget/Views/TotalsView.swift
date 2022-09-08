//
//  TotalsView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 27.7.22..
//

import UIKit



class TotalsView: UIView {
    
    @IBOutlet private weak var labelNameTotal: UILabel!
    
    @IBOutlet private weak var labelAmount: UILabel!
    
  
    
    public var nameTotal: String? {
        didSet {
            labelNameTotal.text = nameTotal
        }
    }

    public var amount: Double? {
        didSet {
            labelAmount.text = "\(amount ?? 0)"
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



