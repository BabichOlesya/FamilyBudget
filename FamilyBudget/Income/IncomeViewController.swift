//
//  IncomeViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class IncomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraints()
        buttonPressed()
    }

    private lazy var addIncomeButton: UIButton = {
        let addIncomeButton = UIButton()
        addIncomeButton.setTitle("Добавить", for: .normal)
        addIncomeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addIncomeButton.backgroundColor = .systemGray2
        addIncomeButton.layer.shadowColor = UIColor.black.cgColor
        addIncomeButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        addIncomeButton.layer.cornerRadius = 7
        addIncomeButton.layer.shadowOpacity = 1
        addIncomeButton.translatesAutoresizingMaskIntoConstraints = false
        return addIncomeButton
    }()
    
    
    var incomes: [AddIncome] = []
    
    func generateIncome(_ count: Count, _ itemIncome: Income, _ sum: Int, _ date: Date) -> AddIncome {
        let newIncome = AddIncome(count: count, itemIncome: itemIncome, sum: sum, date: date)
        incomes.append(newIncome)
        
        return newIncome
        
    //    var incomeArray = [Int]()
    //    for i in 100...120 {
    //        incomeArray.append(i)
    //    }
    }

    var countSber = Count(name: "Сбер", currency: .rub, balance: 0)
    
    @objc func buttonPressed() {
        generateIncome(countSber, .salary, 100, Date.now)
        print("Создан доход")
        print(incomes)
        
    }
    
    private func addConstraints() {
        
        view.addSubview(addIncomeButton)

        var constraints = [NSLayoutConstraint]()
        
        constraints.append(addIncomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50))
        constraints.append(addIncomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(addIncomeButton.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(addIncomeButton.widthAnchor.constraint(equalToConstant: 180))



        NSLayoutConstraint.activate(constraints)
    }
}
