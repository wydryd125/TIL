//
//  LoginView.swift
//  LoginViewAutoLayout
//
//  Created by 정유경 on 2019/12/18.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    let logoImageView = UIImageView()
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let mailImageView = UIImageView()
    let mailTextField = UITextField()
    let mailLine = UILabel()
    let passImageView = UIImageView()
    let passTextField = UITextField()
    let passLine = UILabel()
    let signInButton = UIButton()
    let signUpButton = UIButton()
    
    var buttonConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        baseUI()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func baseUI() {
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = UIImage(named: "fastcampus_logo")
        self.addSubview(logoImageView)
        
        view1.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.1333333333, blue: 0.3058823529, alpha: 1)
        view1.layer.cornerRadius = 8
        self.addSubview(view1)
        
        view2.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.1333333333, blue: 0.3058823529, alpha: 1)
        view2.layer.cornerRadius = 8
        self.addSubview(view2)
        
        view3.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.1333333333, blue: 0.3058823529, alpha: 1)
        view3.layer.cornerRadius = 8
        self.addSubview(view3)
        
        signInButton.backgroundColor = .darkGray
        signInButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitle("Sign In!!", for: .normal)
        signInButton.layer.cornerRadius = 8
        self.addSubview(signInButton)
    
        signUpButton.backgroundColor = .white
        signUpButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        signUpButton.setTitleColor(.darkGray, for: .normal)
        signUpButton.setTitle("Sign Up!", for: .normal)
        self.addSubview(signUpButton)
        
        
        mailImageView.contentMode = .scaleAspectFill
        mailImageView.image = UIImage(named: "email")
        self.addSubview(mailImageView)

        mailTextField.frame.size = CGSize(width: 100, height: 40)
        mailTextField.placeholder = "이메일을 입력해주세요."
        self.addSubview(mailTextField)
        
        mailLine.backgroundColor = .black
        self.addSubview(mailLine)
        
        passImageView.contentMode = .scaleAspectFill
        passImageView.image = UIImage(named: "password")
        self.addSubview(passImageView)
        
        passLine.backgroundColor = .black
        self.addSubview(passLine)
        
        passTextField.placeholder = "비밀번호를 입력해주세요."
        addSubview(passTextField)
        
    }
    
    func autoLayout() {
    // 패스트캠퍼스 로고
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
    // 로고 밑 네모1
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.centerYAnchor.constraint(equalTo: view2.centerYAnchor).isActive = true
        view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: -24).isActive = true
        view1.widthAnchor.constraint(equalToConstant: 28).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 28).isActive = true
         
    // 로고 밑 네모2
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.centerXAnchor.constraint(equalTo: self.logoImageView.centerXAnchor).isActive = true
        view2.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 24).isActive = true
        view2.widthAnchor.constraint(equalToConstant: 28).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 28).isActive = true
    
    // 로고 밑 네모3
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.centerYAnchor.constraint(equalTo: view2.centerYAnchor).isActive = true
        view3.leadingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 24).isActive = true
        view3.widthAnchor.constraint(equalToConstant: 28).isActive = true
        view3.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        
        //------------------------------------------------------------------------------
      
    // 버튼
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        buttonConstraint = signInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        buttonConstraint?.isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    // 회원가입 버튼
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    // 패스워드이미지
        passImageView.translatesAutoresizingMaskIntoConstraints = false
        passImageView.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -70).isActive = true
        passImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        passImageView.widthAnchor.constraint(equalTo: passTextField.heightAnchor).isActive = true
        passImageView.heightAnchor.constraint(equalTo: passTextField.heightAnchor).isActive = true
        
    // 패스워드 텍스트필드
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -70).isActive = true
        passTextField.leadingAnchor.constraint(equalTo: passImageView.trailingAnchor, constant: 30).isActive = true
        passTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        
    // 패스워드 가이드라인
        passLine.translatesAutoresizingMaskIntoConstraints = false
        passLine.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 10).isActive = true
        passLine.leadingAnchor.constraint(equalTo: passTextField.leadingAnchor).isActive = true
        passLine.trailingAnchor.constraint(equalTo: passTextField.trailingAnchor).isActive = true
        passLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
    // 메일이미지
        mailImageView.translatesAutoresizingMaskIntoConstraints = false
        mailImageView.bottomAnchor.constraint(equalTo: passImageView.topAnchor, constant: -50).isActive = true
        mailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        mailImageView.heightAnchor.constraint(equalTo: mailTextField.heightAnchor).isActive = true
        mailImageView.widthAnchor.constraint(equalTo: mailTextField.heightAnchor).isActive = true
        
    //메일 텍스트필드
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        mailTextField.bottomAnchor.constraint(equalTo: passTextField.topAnchor, constant: -50).isActive = true
        mailTextField.leadingAnchor.constraint(equalTo: mailImageView.trailingAnchor, constant: 30).isActive = true
        mailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
       
    //메일 가이드라인
        mailLine.translatesAutoresizingMaskIntoConstraints = false
        mailLine.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 10).isActive = true
        mailLine.leadingAnchor.constraint(equalTo: mailTextField.leadingAnchor).isActive = true
        mailLine.trailingAnchor.constraint(equalTo: mailTextField.trailingAnchor).isActive = true
        mailLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
    }
    
    
    
}
