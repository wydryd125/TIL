//
//  ViewController.swift
//  SingletonUD
//
//  Created by 정유경 on 2019/12/08.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    let singletonButton = UIButton()
    let userDButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.frame.size = CGSize(width: 300, height: 40)
        textField.center = CGPoint(x: view.center.x, y: 200)
        textField.backgroundColor = .blue
        textField.font = .systemFont(ofSize: 30, weight: .bold)
        textField.textColor = .white
        view.addSubview(textField)
        
        singletonButton.frame.size = CGSize(width: 100, height: 100)
        singletonButton.frame.origin = CGPoint(x: 100, y: 600)
        singletonButton.backgroundColor = .yellow
        singletonButton.setTitle("ST", for: .normal)
        singletonButton.setTitleColor(.black, for: .normal)
        singletonButton.addTarget(self, action: #selector(singletonButtonDidTap), for: .touchUpInside)
        view.addSubview(singletonButton)
        
        
        userDButton.frame.size = CGSize(width: 100, height: 100)
        userDButton.frame.origin = CGPoint(x: 200, y: 600)
        userDButton.backgroundColor = .gray
        userDButton.setTitle("UD", for: .normal)
        userDButton.setTitleColor(.black, for: .normal)
        userDButton.addTarget(self, action: #selector(userDefaultsButtonDidTap), for: .touchUpInside)
        view.addSubview(userDButton)
    }
    
    @objc func singletonButtonDidTap() {
        let vcST = STViewController()
        guard let text = textField.text else { return }
        Singleton.shared.text = text
        present(vcST, animated: true)
        
    }
    
    @objc func userDefaultsButtonDidTap() {
        let vcUD = UDViewController()
        UserDefaults.standard.set(textField.text, forKey: "text")
        
        present(vcUD, animated: true)
        
    }
        
    



}

