//
//  SceneDelegate.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let listVC = ListViewController()
        let wishVC = WishListViewController()
        
        
        let naviController = UINavigationController(rootViewController: listVC)
        listVC.title = "Domino's"
        
        let naviController2 = UINavigationController(rootViewController: wishVC)
        wishVC.title = "Wish List"
        
        naviController.tabBarItem = UITabBarItem(title: "Domino's", image: UIImage(systemName: "domino's"), tag: 0)
        naviController2.tabBarItem = UITabBarItem(title: "Wish List", image: UIImage(systemName: "wishlist"), tag: 1)
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [naviController,naviController2]
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = tabBarController
        window.backgroundColor = .systemBackground
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
}


