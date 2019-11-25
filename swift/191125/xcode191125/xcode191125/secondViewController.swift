//
//  secondViewController.swift
//  xcode191125
//
//  Created by 정유경 on 2019/11/25.
//  Copyright © 2019 jeongyukyung. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
        let tag = "두번째 뷰"
        let number = UILabel()
        var secondCount = 1
        
        override func viewDidLoad() {
            super.viewDidLoad()
            print(tag+"view Did Load")
            setupUI()
            
            
            
        }
        
        func setupUI() {
            if #available(iOS 13.0, *) {
                view.backgroundColor = .orange
            } else {
                view.backgroundColor = .orange
            }
            
            let button = UIButton(type: .system)
            button.frame.size = CGSize(width: 100, height: 50)
            button.center = view.center
            button.setTitle("클릭!", for: .normal)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            view.addSubview(button)
            
        
            number.frame = CGRect(x: 200, y: 200, width: 100, height: 50)
            number.font = UIFont.systemFont(ofSize: 50)
            number.text = "\(secondCount)"
            view.addSubview(number)
            
            
            
       
        }
        
    
        @objc private func didTapButton(_ sender: UIButton) {
         
//            let secondVC = ViewController()
//            secondVC.count = secondCount + 1
//            secondVC.modalPresentationStyle = .fullScreen
//            secondVC.view.backgroundColor = .orange
//
//
//            present(secondVC, animated: true)
            
            guard let vc = presentingViewController as? ViewController else{return}
            vc.count = secondCount + 1
            dismiss(animated: true)
            
            
        }
       
       
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print(tag+"view Will Appear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print(tag+"view Did Appear")
        }
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print(tag+"view Will Disappear")
        }
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print(tag+"view Did Disappear")
        }
    deinit {
        print(tag+"deinit")
    }


    }




