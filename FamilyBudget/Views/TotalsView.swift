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
            self.setupView()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            self.setupView()
        }

        private func setupView() {
            let view = self.loadViewFromXib()
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }


        private func loadViewFromXib() -> UIView {
            let nib = UINib(nibName: "TotalsView", bundle: Bundle.main)
            let balanceView = nib.instantiate(withOwner: self, options: nil).first as! TotalsView
            
//            guard let view = Bundle.main.loadNibNamed("TotalsView", owner: nil, options: nil)?.first as? UIView else { return UIView() }
            return balanceView
        }
    
}



