//
//  UIView+LoadNib.swift
//  FamilyBudget
//
//  Created by Temporary Admin on 12.08.22.
//

import Foundation
import UIKit

public extension UIView {
  func initializeFromNib() {
    let nibName = String(describing: Self.self) 
    let bundle = Bundle(for: Self.self)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
    addSubview(view)
    view.frame = bounds
  }
}

