//
//  MainTabBarController.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 20.7.22..
//

import UIKit

class MainTabBarController: UITabBarController {

    private let titles = ["Budget", "Costs", "Income"] // почему это не безопасно?
    
    private let icons: [UIImage?] = [UIImage(named: "bag.circle"), UIImage(named: "minus.circle"), UIImage(named: "plus.circle")] //добавь икноки в Assets

    override var viewControllers: [UIViewController]? {
        didSet {
            setTitles()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitles()
        setIcons()
    }

    private func setIcons() {
        tabBar.items?.enumerated().forEach { index, item in
            item.image = icons[index]
        }
    }

    private func setTitles() {
        viewControllers?.enumerated().forEach { index, controller in
            controller.title = titles[index]
        }
    }
}
