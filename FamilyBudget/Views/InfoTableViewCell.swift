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
  
  public var transaction: FinanceInformation?

  public static let identifier = "InfoTableViewCell"

  public func setup() {
    if let transaction = transaction as? Income {
      setupIncomeItem(transaction)
    }
    if let transaction = transaction as? Expense {
      setupExpenseItem(transaction)
    }
  }
  
  private func setupIncomeItem(_ income: Income) {
    accountLabel.text = income.account.name
    typeLabel.text = income.type.rawValue
    amountLabel.text = "\(income.amount) \(income.account.currency.symbol)"
  }
  
  private func setupExpenseItem(_ expense: Expense) {
    accountLabel.text = expense.account.name
    typeLabel.text = expense.type.rawValue
    amountLabel.text = "\(expense.amount) \(expense.account.currency.symbol)"
  }
}
