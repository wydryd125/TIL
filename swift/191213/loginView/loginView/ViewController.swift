//
//  ViewController.swift
//  loginView
//
//  Created by 정유경 on 2019/12/16.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = LoginView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        view.backgroundColor = .black
        setLoginView()
        
        
    }
    
    func setLoginView() {
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    
    
}




