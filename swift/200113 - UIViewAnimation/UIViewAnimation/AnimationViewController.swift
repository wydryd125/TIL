//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet private weak var userIdTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  @IBOutlet private weak var loginButton: UIButton!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet private weak var countDownLabel: UILabel!
  
  var count = 4 {
    didSet { countDownLabel.text = "\(count)" }
  }
  
  // MARK: - View LifeCycle

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    activityIndicatorView.isHidden = true
    userIdTextField.center.x = -view.frame.width
    passwordTextField.center.x = -view.frame.width
    loginButton.center.x = -view.frame.width
    
    }
    @IBOutlet weak var testView: UIView!
    func test() {
        let initialFrame = testView.frame
        UIView.animateKeyframes(
            withDuration: 10,
            delay: 0,
            animations: {
                // 10초 * 0.0 = 0 , 2.5초 동안 애니메이션
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    self.testView.center.x += 50
                    self.testView.center.y -= 150
                }
                 // 10초 * 0.25 = 2.5초 , 2.5초 동안 애니메이션, 2.5초 뒤에 2.5초 동안 애니메이션, 5초
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    self.testView.center.x += 100
                    self.testView.center.y -= 50
                }
                 // 7초 - 5초 = 2초, 10초 * 0.7 = 7초 10초 * 0.3 = 3초
                UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
                    self.testView.frame = initialFrame
                }
        })
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        test()
        UIView.animate(withDuration: 0.6) {
            self.userIdTextField.center.x = self.userIdTextField.superview!.bounds.midX
        }
        UIView.animate(withDuration: 0.6, delay: 1, animations:  {
            self.passwordTextField.center.x =
                self.passwordTextField.superview!.bounds.midX
           
        })
        //initialSpringVelocity,usingSpringWithDamping - 튕기는 동작을 하게함.
        UIView.animate(withDuration: 0.6,
                       delay: 1,
                       usingSpringWithDamping: 0.6 ,
                       initialSpringVelocity: 0,
                       options: [.curveEaseInOut, .autoreverse],//기본값이 curveEaseInOut
            animations: { self.loginButton.center.x = self.loginButton.superview!.bounds.midX },
            completion: { print("isFinished :", $0)
        })
    }
  
  // MARK: - Action Handler
  
  @IBAction private func didEndOnExit(_ sender: Any) {}
  
  @IBAction private func login(_ sender: Any) {
    view.endEditing(true)
    
    guard countDownLabel.isHidden else { return }
    loginButtonAnimation()
    countDown()
  }

  
  func addAnimateKeyframes() {
    
  }
  
  func loginButtonAnimation() {
    activityIndicatorView.isHidden = false
    activityIndicatorView.startAnimating()
    //버튼 원래 자리를 저장.
    let centerOrigin = loginButton.center
    
    UIView.animateKeyframes(
        withDuration: 1.6,
        delay: 0,
        animations: {
            UIView.addKeyframe(
            //로긴 버튼을 0.4초동안 아래로 이동
            withRelativeStartTime: 0.0, relativeDuration: 0.25){
                self.loginButton.center.x += 50
                self.loginButton.center.y += 20
            }
            //버튼이 45도 회전하여 우측 상단으로 이동하며 흐려지다가 사라짐
            UIView.addKeyframe(
            withRelativeStartTime: 0.25, relativeDuration: 0.25){
                self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                self.loginButton.center.x += 150.0
                self.loginButton.center.y -= 70.0
                self.loginButton.alpha = 0.0
            }
            //처음에 있던 위치의 아래에 위치하도록함(안 보이는 상태)
            UIView.addKeyframe(
            withRelativeStartTime: 0.51, relativeDuration: 0.01){
                self.loginButton.transform = .identity
                self.loginButton.center = CGPoint(
                    x: centerOrigin.x,
                    y: self.loginButton.superview!.frame.height + 120
                )
            }
            //처음의 위치로 돌아오면서 다시 나타남
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25){
            self.loginButton.alpha = 1.0
            self.loginButton.center = centerOrigin
            }
            
    }) { _ in
  
    }
  }
  
  func countDown() {
    countDownLabel.isHidden = false
    
    UIView.transition(with: self.countDownLabel,
                      duration: 0.5,
                      options: [.transitionCrossDissolve],
                      animations: { self.count -= 1 })
    { _ in
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard self.count == 0 else { return self.countDown() }
            self.count = 4
            self.countDownLabel.isHidden = true
            self.activityIndicatorView.stopAnimating()
            self.activityIndicatorView.isHidden = true
        }
    }
  }
}
