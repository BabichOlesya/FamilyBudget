//
//  InfoTableViewCell.swift
//  FamilyBudget
//
//  Created by Tatiana Mudryak on 03.09.22.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
  
  @IBOutlet weak var categoryImageView: UIImageView!
  @IBOutlet weak var accountLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var amountLabel: UILabel!
  
  public var income: Income?
    
  public func setup() {
    guard let income = income else {
      return
    }
    accountLabel.text = income.account.name
    typeLabel.text = income.type.rawValue
    amountLabel.text = "\(income.sum) \(income.account.currency.symbol)"
  }
}
