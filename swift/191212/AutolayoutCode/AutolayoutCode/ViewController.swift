//
//  ViewController.swift
//  AutolayoutCode
//
//  Created by 정유경 on 2019/12/12.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   let view1 = UIView()
        let view2 = UIView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
          
            print("viewDidLoad", view.safeAreaInsets)
            
            baseUI()
        }
    /* viewWillApper
         -> viewSafeAreaInsetDidChange
         -> viewWillLayoutSubViews
         -> viewDidLayoutSubWiews
         -> viewDidApear */
        
        override func viewSafeAreaInsetsDidChange() {
            super.viewSafeAreaInsetsDidChange()
            
            print("viewSafeAreaInsetsDidChange", view.safeAreaInsets)
            
            let space: CGFloat = 20
            let safe = view.safeAreaInsets
            let viewWidth = (view.frame.width / 2) - (space + 5)
            let viewHeight = view.frame.height - (safe.top + space) - (safe.bottom + space)
            
            view1.frame = CGRect(
                x: safe.left + space,
                y: safe.top + space,
                width: viewWidth,
                height: viewHeight
            )
            
            view2.frame = CGRect(
                x: view1.frame.maxX + 10,
                y: safe.top + space,
                width: viewWidth,
                height: viewHeight
            )
            
            
        }
        
        func baseUI() {
            view1.backgroundColor = .darkGray
            view.addSubview(view1)
            
            view2.backgroundColor = .yellow
            view.addSubview(view2)
        }

    }
               


