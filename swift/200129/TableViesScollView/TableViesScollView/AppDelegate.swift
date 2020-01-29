//
//  AppDelegate.swift
//  TableViesScollView
//
//  Created by 정유경 on 2020/01/29.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let tabbar = UITabBarController()
        let tableVC = UINavigationController(rootViewController: TableViewController())
        let scrollVC = UINavigationController(rootViewController: ScrollViewController())
        tableVC.tabBarItem = UITabBarItem(title: "Table", image: nil, tag: 0)
        scrollVC.tabBarItem = UITabBarItem(title: "Scroll", image: nil, tag: 0)
        
        tabbar.viewControllers = [tableVC, scrollVC]
        
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
        
        
        return true
    }
    
    
}

