//
//  ControlView.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/02.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class ControlView: UIView {
  
  let startButton = UIButton()
  let cancelButton = UIButton()

  override init(frame: CGRect) {
    super.init(frame: frame)
    baseUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func baseUI() {

//    startButton.setTitle("시작", for: .normal)
//    startButton.backgroundColor = .blue
//    startButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
//    startButton.titleLabel?.textAlignment = .center
    startButton.setImage(UIImage(named: "시작"), for: .normal)
    startButton.imageView?.contentMode = .scaleAspectFit
    
//    cancelButton.setImage(UIImage(named: "정지"), for: .normal)
//    cancelButton.imageView?.contentMode = .scaleAspectFill
//    cancelButton.isHidden = true
//        cancelButton.setTitle("포기", for: .normal)
//        cancelButton.backgroundColor = .red
//        cancelButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
//    cancelButton.titleLabel?.textAlignment = .center
    
    self.addSubview(startButton)
//    self.addSubview(cancelButton)
    
    startButton.translatesAutoresizingMaskIntoConstraints = false
//    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    
    startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    startButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    startButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    startButton.widthAnchor.constraint(equalTo: startButton.heightAnchor).isActive = true
    
//    cancelButton.leadingAnchor.constraint(equalTo: , constant: 58).isActive = true
//    cancelButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//    cancelButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
//    cancelButton.widthAnchor.constraint(equalTo: startButton.heightAnchor).isActive = true
    
//    cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
//    cancelButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//    cancelButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
//    cancelButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
    
  }
}
