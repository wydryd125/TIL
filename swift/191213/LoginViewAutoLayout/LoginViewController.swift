//
//  LoginViewController.swift
//  LoginViewAutoLayout
//
//  Created by 정유경 on 2019/12/21.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let emailTextField = UITextField()
    let emailLine = UILabel()
    let passTextField = UITextField()
    let passLine = UILabel()
    let pass2TextField = UITextField()
    let pass2Line = UILabel()
    let signUpButton2 = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        baseUI()
        autoLayout()
        
    }
    func baseUI() {
        
        emailTextField.placeholder = "사용할 email을 입력하세요."
        emailTextField.font = .systemFont(ofSize: 20, weight: .bold)
        emailTextField.backgroundColor = .white
        emailTextField.textColor = .black
        view.addSubview(emailTextField)
        
        emailLine.backgroundColor = .black
        view.addSubview(emailLine)
        
        passTextField.placeholder = "비밀번호는 4~16자 입니다."
        passTextField.font = .systemFont(ofSize: 20, weight: .bold)
        passTextField.backgroundColor = .white
        passTextField.textColor = .black
        view.addSubview(passTextField)
        
        passLine.backgroundColor = .black
        view.addSubview(passLine)
        
        pass2TextField.placeholder = "비밀번호 확인"
        pass2TextField.font = .systemFont(ofSize: 20, weight: .bold)
        pass2TextField.backgroundColor = .white
        pass2TextField.textColor = .black
        view.addSubview(pass2TextField)
        
        pass2Line.backgroundColor = .black
        view.addSubview(pass2Line)
        
        
        signUpButton2.backgroundColor = .darkGray
        signUpButton2.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        signUpButton2.setTitleColor(.white, for: .normal)
        signUpButton2.setTitle("Sign Up!!", for: .normal)
        signUpButton2.layer.cornerRadius = 8
        signUpButton2.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
        view.addSubview(signUpButton2)
        
        
        
        
    }
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        emailLine.translatesAutoresizingMaskIntoConstraints = false
        emailLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailLine.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor).isActive = true
        emailLine.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        emailLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        passTextField.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor).isActive = true
        passTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passLine.translatesAutoresizingMaskIntoConstraints = false
        passLine.topAnchor.constraint(equalTo: passTextField.bottomAnchor).isActive = true
        passLine.centerXAnchor.constraint(equalTo: passTextField.centerXAnchor).isActive = true
        passLine.widthAnchor.constraint(equalTo: passTextField.widthAnchor).isActive = true
        passLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        pass2TextField.translatesAutoresizingMaskIntoConstraints = false
        pass2TextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 30).isActive = true
        pass2TextField.centerXAnchor.constraint(equalTo: passTextField.centerXAnchor).isActive = true
        pass2TextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pass2TextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pass2Line.translatesAutoresizingMaskIntoConstraints = false
        pass2Line.topAnchor.constraint(equalTo: pass2TextField.bottomAnchor).isActive = true
        pass2Line.centerXAnchor.constraint(equalTo: pass2TextField.centerXAnchor).isActive = true
        pass2Line.widthAnchor.constraint(equalTo: pass2TextField.widthAnchor).isActive = true
        pass2Line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        signUpButton2.translatesAutoresizingMaskIntoConstraints = false
        signUpButton2.topAnchor.constraint(equalTo: pass2TextField.bottomAnchor, constant: 60).isActive = true
        signUpButton2.centerXAnchor.constraint(equalTo: pass2TextField.centerXAnchor).isActive = true
        signUpButton2.widthAnchor.constraint(equalToConstant: 250).isActive = true
        signUpButton2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        
    }
    
    
    func alert(message: String) {
        let alertController = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "닫 기", style: .default)
        
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
    
    @objc func signUpButtonDidTap() {
        guard let email = emailTextField.text, !email.isEmpty else {
            alert(message: "이메일을 입력해주세요")
            return
        }
        
        guard
            let pass1 = passTextField.text,
            !pass1.isEmpty,
            let pass2 = pass2TextField.text,
            !pass2.isEmpty
            else {
            alert(message: "비밀번호를 확인해주세요")
            return
        }
        
        guard 4...16 ~= pass1.count, 4...16 ~= pass2.count  else {
            alert(message: "비밀번호는 4자이상 16자 이하 입력 가능합니다")
            return
        }
        
        
        guard pass1 == pass2 else {
            alert(message: "비밀번호가 틀립니다")
            return
        }
        
        UserDefaults.standard.set(pass1, forKey: email)
        
        dismiss(animated: true)
    }
}
