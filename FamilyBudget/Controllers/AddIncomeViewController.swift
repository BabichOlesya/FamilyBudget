//
//  AddIncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 19.8.22..
//

import UIKit

class AddIncomeViewController: UIViewController {
    
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
        title = "Создать доход"
        
        view.addSubview(addIncomeView)
        addConstraints()
    }
    
    lazy var addIncomeView: UIView = {
        let addIncomeView = AddIncomeCostView()
        addIncomeView.contentMode = .scaleAspectFit
        addIncomeView.layer.masksToBounds = true
        addIncomeView.translatesAutoresizingMaskIntoConstraints = false
        return addIncomeView
    }()
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            
            addIncomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.upperIndentS),
            addIncomeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constant.lateralIndent),
            addIncomeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constant.lateralIndent),
            
        ])
    }
    
    
    
}
