//
//  BudgetViewController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 28.6.22..
//

import UIKit

class BudgetViewController: UIViewController {
    
//    let bud = BudgetView()
//    let budMan = BudgetManager()
//    self.bud.textTitle = self.budMan.totalIncomes

  // MARK : Private API
  private var balance = TotalsView()
  private var income = TotalsView()
  private var cost =  TotalsView()
  
  // TO-DO
  private enum Constant {
    static let diagramImageViewWidth: CGFloat = 180.0
  }

  // MARK : Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = "Бюджет"
    
    view.addSubview(diagramImageView)
    view.addSubview(statusStackView)
    view.addSubview(labelStackView)
    addConstraints()

    let imageForSettings = UIImage(systemName: "circle.hexagonpath.fill")
    let buttonSettings = UIBarButtonItem(image: imageForSettings , style: .done, target: self, action: #selector(clickButtonSettings))
    navigationItem.leftBarButtonItem = buttonSettings
    }
    
    @objc func clickButtonSettings() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    lazy var diagramImageView: UIImageView = {
        let diagramImage = UIImage(named: "diag")
        let diagramImageView = UIImageView(image: diagramImage)
        diagramImageView.contentMode = .scaleAspectFit
        diagramImageView.layer.masksToBounds = true
        diagramImageView.translatesAutoresizingMaskIntoConstraints = false
        return diagramImageView
    }()
    
    private lazy var status: UILabel = {
        let status = UILabel()
        status.text = "Статус выполнения бюджета"
        status.font = .systemFont(ofSize: 16, weight: .bold)
        status.textColor = .systemGray
        status.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        status.numberOfLines = 3
        status.textAlignment = .center
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var monthButton: UIButton = {
        let monthButton = UIButton()
        monthButton.setTitle("Месяц", for: .normal)
        monthButton.backgroundColor = .systemGray2
        monthButton.layer.shadowColor = UIColor.black.cgColor
        monthButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        monthButton.layer.cornerRadius = 7
        monthButton.layer.shadowOpacity = 1
        monthButton.translatesAutoresizingMaskIntoConstraints = false
        return monthButton
    }()
    
    private lazy var statusStackView: UIStackView = {
        let statusStackView = UIStackView()
        statusStackView.axis = .vertical
        statusStackView.distribution = .equalSpacing
        statusStackView.spacing = 30
        statusStackView.translatesAutoresizingMaskIntoConstraints = false
        return statusStackView
    }()
 
    private lazy var labelStackView: UIStackView = {
        let labelstackView = UIStackView()
        labelstackView.axis = .vertical
        labelstackView.distribution = .fillEqually
        labelstackView.spacing = 30
        labelstackView.translatesAutoresizingMaskIntoConstraints = false
        return labelstackView
    }()

  
    private func addConstraints() {
      // TO-DO
        statusStackView.addArrangedSubview(monthButton)
        statusStackView.addArrangedSubview(status)
        labelStackView.addArrangedSubview(balance)
        labelStackView.addArrangedSubview(income)
        labelStackView.addArrangedSubview(cost)

      // TO-DO
      NSLayoutConstraint.activate([
        diagramImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        diagramImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        diagramImageView.heightAnchor.constraint(equalToConstant: Constant.diagramImageViewWidth),
        diagramImageView.widthAnchor.constraint(equalToConstant: 180)
      ])

        var constraints = [NSLayoutConstraint]()

        constraints.append(statusStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30))
        constraints.append(statusStackView.leadingAnchor.constraint(equalTo: diagramImageView.trailingAnchor, constant: 20))
        constraints.append(statusStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20))
        constraints.append(statusStackView.heightAnchor.constraint(equalToConstant: 130))
        
        constraints.append(labelStackView.topAnchor.constraint(equalTo: diagramImageView.bottomAnchor, constant: 50))
        constraints.append(labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20))
        constraints.append(labelStackView.heightAnchor.constraint(equalToConstant: 240))

        NSLayoutConstraint.activate(constraints)
    }
}
