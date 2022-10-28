//
//  Utilities.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 7.7.22..
//

import Foundation

enum Sex {
  case male, female, undefined
}

enum Currency: String, Codable {
  case rub, eur, usd, gbp
  
  var symbol: String {
    switch self {
    case .eur:
      return "€"
    case .rub:
      return "Rub"
    case .usd:
      return "$"
    case .gbp:
      return "£"
    }
  }
}
