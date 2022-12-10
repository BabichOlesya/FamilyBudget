//
//  TestableClass.swift
//  FamilyBudget
//
//  Created by Tatiana Mudryak on 02.12.22.
//

import Foundation

class MiniCalculator {
  
  var initialValue: Double = 0.0
  var firstNumber: Double = 0.0
  var secondNumber: Double = 0.0
  private(set) var result: Double?
  
  var sum: Double {
    firstNumber + secondNumber
  }
  
  var difference: Double {
    firstNumber - secondNumber
  }
  
  var difficultFunction: Double {
    sum * 2 + difference
  }
  
  func multiplySum(by multiplier: Double) {
    result = sum * multiplier
  }
}

extension MiniCalculator {
    
    var Tresult: Double? {
        get {
            return self.result
        }
    }
}
