//
//  AppDelegate.swift
//  xcode191125
//
//  Created by 정유경 on 2019/11/25.
//  Copyright © 2019 jeongyukyung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 버전과 관계없이 최초로 호출되는 Override point for customization after application launch.
        
        if #available(iOS 13.0, *) {
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.backgroundColor = .white
            window?.rootViewController = ViewController()
            window?.makeKeyAndVisible()
        }
            
            return true
            
        }



}
