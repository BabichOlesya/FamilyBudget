//
//  General.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 3.7.22..
//

import Foundation

struct User {
    var name: String
    var email: String
    var age: Int
    var sex: Sex
    var costAccounting: Bool
    var incomeAccounting: Bool
}

enum Month {
    case jan, feb, mar, apr, may, june, july, aug, sept, oct, nov, dec
}

enum Sex {
    case male, female, undefined
}
