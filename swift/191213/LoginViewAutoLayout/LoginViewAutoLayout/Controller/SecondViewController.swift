//
//  SecondViewController.swift
//  LoginViewAutoLayout
//
//  Created by 정유경 on 2019/12/18.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let loginLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        baseUI()
        autoLayout()
        
    
    }
    func baseUI() {
        
        if let email = UserDefaults.standard.string(forKey: "mail") {
            loginLabel.text = "반가워요! \(email)🐹"
        }
        loginLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        loginLabel.backgroundColor = #colorLiteral(red: 0.3054754056, green: 0.4068715089, blue: 0.8318527919, alpha: 1)
        loginLabel.textColor = .white
        loginLabel.textAlignment = .center
        view.addSubview(loginLabel)
        
    }
    
    func autoLayout() {
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        loginLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        loginLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    


}
