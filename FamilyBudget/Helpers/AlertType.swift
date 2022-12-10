//
//  AlertType.swift
//  FamilyBudget
//
//  Created by Tatiana Mudryak on 10.12.22.
//

import Foundation

public enum AlertType {
  case zeroAmount, success, wrongDate, internetConnection, error
  
  var title: String {
    switch self {
    case .zeroAmount:
      return "Wrong amount"
    case .success:
      return "Wow!"
    default:
      return "Default Title"
    }
  }
  
  var message: String {
    switch self {
    case .zeroAmount:
      return "Amount can not be equal 0"
    case .success:
      return "Operation has been done successfuly"
    default:
      return "Default Message"
    }
  }
}
