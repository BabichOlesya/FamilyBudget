//
//  InfoTableViewCell.swift
//  FamilyBudget
//
//  Created by Tatiana Mudryak on 03.09.22.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    public var income: Income? {
        didSet {
            setup()
        }
    }
    
    public func setup() {
        textLabel?.text = "\(income?.account.name)" + "\(income?.sum)"
    }
    
}
