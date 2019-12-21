//
//  ViewController.swift
//  LoginViewAutoLayout
//
//  Created by 정유경 on 2019/12/18.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = LoginView(frame: .zero)
    let mail = "Yukyung"
    let pass = "1234"
    var tempText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        setLoginView()
      
        myView.mailTextField.delegate = self
    }
    
    func setLoginView() {
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        myView.signInButton.addTarget(self, action: #selector(didTapbutton), for: .touchUpInside)
        myView.signUpButton.addTarget(self, action: #selector(signUpDidTapButton), for: .touchUpInside)
        
    }
    @objc func didTapbutton() {
        guard
            let mail = myView.mailTextField.text,
            !mail.isEmpty,
            let pass = myView.passTextField.text,
            !pass.isEmpty
            else { return }
        
        guard let udPass = UserDefaults.standard.string(forKey: mail), udPass == pass else {
            myView.mailTextField.backgroundColor = .red
            myView.passTextField.backgroundColor = .red

            UIView.animate(withDuration: 1.5) {
                self.myView.mailTextField.backgroundColor = .white
                self.myView.passTextField.backgroundColor = .white
            }
            
            alert(message: "로그인 정보가 틀립니다.")
            return
        }
        
        UserDefaults.standard.set(mail, forKey: "mail")
        
        let vc = SecondViewController()
        present(vc, animated: true)
        
        
//        if mail == myView.mailTextField.text, pass == myView.passTextField.text {
//
//            UserDefaults.standard.set(mail, forKey: "mail")
//
//            let vc = SecondViewController()
//            present(vc, animated: true)
//
//
//        } else {
//            myView.mailTextField.backgroundColor = .red
//            myView.passTextField.backgroundColor = .red
//
//            UIView.animate(withDuration: 1.5) {
//                self.myView.mailTextField.backgroundColor = .white
//                self.myView.passTextField.backgroundColor = .white
//            }
//        }
    }
    @objc func signUpDidTapButton() {
        
        let loginVC = LoginViewController()
        present(loginVC, animated: true)
        
    }
    
    func alert(message: String) {
        let alertController = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "닫 기", style: .default)
        
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
}
    
extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if text.count > 16 {
            textField.text = tempText
        } else {
            tempText = text
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        UIView.animate(withDuration: 0.3) {
            self.myView.buttonConstraint?.constant = -300
            self.view.layoutIfNeeded()
        }
        
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3) {
            self.myView.buttonConstraint?.constant = -100
            self.view.layoutIfNeeded()
        }
        
        return true
    }
    
    
    
    
}




