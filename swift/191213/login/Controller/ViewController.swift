//
//  ViewController.swift
//  login
//
//  Created by 정유경 on 2019/12/13.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var logInView = TextField(frame: CGRect(
        x: 30,
        y: 550,
        width: view.frame.width - 60,
        height: 200
        )
    )
    
    @IBOutlet weak var fastLabel: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseUI()
    }
    
    func baseUI() {
        view1.layer.cornerRadius = 8
        view2.layer.cornerRadius = 8
        view3.layer.cornerRadius = 8
        
        
        logInView.signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        logInView.mailTextField.delegate = self
        view.addSubview(logInView)
    }
    
    @objc func signInAction() {
        logInView.mailTextField.resignFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.logInView.center.y = 650
        }
        
        
//        let vc =  NextViewController()
//        present(vc,animated: true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        
        UIView.animate(withDuration: 0.3) {
            self.logInView.center.y = 400
        }
        return true
    }
    
   
}
