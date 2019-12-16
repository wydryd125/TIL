//
//  LoginView.swift
//  loginView
//
//  Created by 정유경 on 2019/12/16.
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        baseUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func baseUI() {
        logoImageView.image = UIImage(named: "fastcampus_logo")
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
//        logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        logoImageView.contentMode = .scaleAspectFill
        
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        
        
        
    }
    
}
