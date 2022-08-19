//
//  AddCostViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class AddCostViewController: UIViewController {
    
    // MARK : Private API
    private var addIncome = AddIncomeCostView()
    
    private enum Constant {
        static let lateralIndent: CGFloat = 20.0
        static let upperIndentS: CGFloat = 10.0
        static let upperIndentL: CGFloat = 30.0
        static let bottomIndentL: CGFloat = 50.0
        static let spacing: CGFloat = 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Создать расход"
        
        view.addSubview(addCostView)
        addConstraints()
    }
    
    lazy var addCostView: UIView = {
        let addCostView = AddIncomeCostView()
        addCostView.contentMode = .scaleAspectFit
        addCostView.layer.masksToBounds = true
        addCostView.translatesAutoresizingMaskIntoConstraints = false
        return addCostView
    }()
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            addCostView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentS),
            addCostView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
            addCostView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constant.lateralIndent),
            
        ])
    }
    
}
