//
//  AppDelegate.swift
//  FamilyBudget
//
//  Created by Олеся Бабич on 27.6.22..
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window : UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
    self.window?.rootViewController = MainTabBarController()
    self.window?.makeKeyAndVisible()
    return true
  }
}

