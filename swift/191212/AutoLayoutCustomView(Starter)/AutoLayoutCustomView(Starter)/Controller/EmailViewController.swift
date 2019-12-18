//
//  EmailViewController.swift
//  AutoLayoutCustomView(Starter)
//
//  Created by Lee on 2019/12/18.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    baseUI()
  }
  
  private func baseUI() {
    view.backgroundColor = .white
    
    let customView = TextFieldType1(frame: .zero, title: "이메일을 입력해주세요", buttonTitle: "다 음")
    customView.delegate = self
    view.addSubview(customView)
    
    let guide = view.safeAreaLayoutGuide
    customView.translatesAutoresizingMaskIntoConstraints = false
    customView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    customView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    customView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
  }
  
  private func alertAction(tilte: String?, message: String?) {
    let alert = UIAlertController(title: tilte, message: message, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "닫 기", style: .cancel)
    alert.addAction(cancel)
    present(alert, animated: true)
  }
}

extension EmailViewController: TextFieldType1Delegate {
  func buttonDidTap(text: String?) {
    guard let email = text, !email.isEmpty else {
      alertAction(tilte: "에러", message: "입력값이 없습니다")
      return
    }
    
    let vc = NickNameViewController()
    present(vc, animated: true)
  }
}
