//
//  TextField.swift
//  login
//
//  Created by 정유경 on 2019/12/13.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class TextField: UIView {
    
    let mailImageView = UIImageView()
    let mailTextField = UITextField()
    let mailLine = UILabel()
    let passImageView = UIImageView()
    let passTextField = UITextField()
    let passLine = UILabel()
    let signInButton = UIButton()
    
    
    override init(frame: CGRect ) {
        super.init(frame: frame)
        
   
        baseUI()
        setFrame()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseUI() {
        mailImageView.image = UIImage(named: "email")
        self.addSubview(mailImageView)
        
        mailTextField.placeholder = "이메일을 입력하세요."
        self.addSubview(mailTextField)
        
        mailLine.backgroundColor = .black
        self.addSubview(mailLine)
        
        passImageView.image = UIImage(named: "password")
        self.addSubview(passImageView)
        
        passTextField.placeholder = "비밀번호를 입력하세요."
        self.addSubview(passTextField)
        
        passLine.backgroundColor = .black
        self.addSubview(passLine)
        
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .darkGray
        signInButton.layer.cornerRadius = 20
        self.addSubview(signInButton)
        
        
    }
    
    
    private func setFrame() {
        
        mailImageView.frame = CGRect(
            x: 0,
            y: 0,
            width: 30,
            height: 30
        )
        
        mailTextField.frame = CGRect(
            x: mailImageView.frame.maxX + 15,
            y: 0,
            width: self.frame.width - (mailImageView.frame.maxX + 15),
            height: 40
        )
        
        mailLine.frame = CGRect(
            x: mailTextField.frame.minX,
            y: mailTextField.frame.maxY,
            width: mailTextField.frame.width,
            height: 0.5
        )
        
        passImageView.frame = CGRect(
            x: 0,
            y: mailTextField.frame.maxY + 20,
            width: 30,
            height: 30
        )
        passTextField.frame = CGRect(
            x: passImageView.frame.maxX + 15,
            y: mailTextField.frame.maxY + 20,
            width: self.frame.width - (passImageView.frame.maxX + 15),
            height: 40
        )
        passLine.frame = CGRect(
            x: passTextField.frame.minX,
            y: passTextField.frame.maxY,
            width: passTextField.frame.width,
            height: 0.5
        )
        
        signInButton.frame = CGRect(x: 0, y: passLine.frame.maxY + 72, width: self.frame.width, height: 40)
        
        
    }
    
    
    
}
