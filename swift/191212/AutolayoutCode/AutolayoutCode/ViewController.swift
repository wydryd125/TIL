//
//  ViewController.swift
//  AutolayoutCode
//
//  Created by 정유경 on 2019/12/12.
//  Copyright © 2019 정유경. All rights reserved.
//
 //!!!!!!!!!!!!!!!!!11->뷰의 안전구역이 바뀔때마다 즉, 가로, 세로 모드로 변경될 때!!!!!!!!!!!!



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
        
    
    //->뷰의 안전구역이 바뀔때마다 즉, 가로, 세로 모드로 변경될 때!!!!!!!!
        override func viewSafeAreaInsetsDidChange() {
            super.viewSafeAreaInsetsDidChange()
            
            print("viewSafeAreaInsetsDidChange", view.safeAreaInsets)
            
            let space: CGFloat = 20
            let safe = view.safeAreaInsets
            //-> 세로모드일때는 좌우 안전구역이 없어도 되어 safe.left, sate.right를 빼주지 않아도 되었지만 가로모드로 바꿨을땐 좌우 안전구역이 필요하기 때문에 꼭 밑에처럼 작성해주어야 함.
            let viewWidth = ((view.frame.width - safe.left - safe.right) / 2) - (space + 5)
           //-> 모드가 바뀌때마다 값이바뀌기 때문에
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
               


