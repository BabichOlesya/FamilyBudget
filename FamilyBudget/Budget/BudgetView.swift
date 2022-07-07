//
//  BudgetView.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 7.7.22..
//

import UIKit

class BudgetView: UIView {
    
    @IBOutlet weak var monthsButton: UIButton!
    @IBOutlet weak var budgetImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var totalIncomeLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var balanceSumLabel: UILabel!
    @IBOutlet weak var incomeSumLabel: UILabel!
    @IBOutlet weak var costSumLabel: UILabel!
    
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
        guard let view = Bundle.main.loadNibNamed("BudgetView", owner: nil, options: nil)?.first as? UIView else { return UIView() }
        return view
    }

}
