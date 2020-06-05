//
//  AnimationTaskViewController.swift
//  UIViewAnimation
//
//  Created by 정유경 on 2020/01/13.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class AnimationTaskViewController: UIViewController {
    
    var isBack = false
    var isBack2 = false
    var buttons = [UIButton]()
    var buttons2 = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    struct Padding {
        static let itemSpace: CGFloat = 120
        static let buttonSize: CGFloat = 80
    }
    
    func setUI() {
        createButtons(count: 6)
        createButtons2(count: 6)
    }
    
    func createButtons(count: Int) {
        for index in 0..<count {
            print(index)
            let tempButton = UIButton()
            tempButton.frame = CGRect(
                x: view.frame.minX + 40,
                y: view.frame.maxY - 200,
                width: Padding.buttonSize,
                height: Padding.buttonSize
            )
            tempButton.setTitle("Btn\(index + 1)", for: .normal)
            tempButton.backgroundColor = .random
            tempButton.layer.cornerRadius = Padding.buttonSize / 2
            buttons.append(tempButton)
            
            if index == 0 {
                tempButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            } else {
                tempButton.transform = .init(scaleX: 0.3, y: 0.3)
            }
        }
        buttons.reverse()
        
        //밑의 for문과 같음.
        //        buttons.forEach { view.addSubview($0) }
        for button in buttons { view.addSubview(button) }
        
        buttons.reverse()
    }
    func createButtons2(count: Int) {
        for index in 0..<count {
            print("222", index)
            let tempButton2 = UIButton()
            tempButton2.frame = CGRect(
                x: view.frame.maxX - 120,
                y: view.frame.maxY - 200,
                width: Padding.buttonSize,
                height: Padding.buttonSize
            )
            tempButton2.setTitle("Btn\(index + 1)", for: .normal)
            tempButton2.backgroundColor = .random
            tempButton2.layer.cornerRadius = Padding.buttonSize / 2
            buttons2.append(tempButton2)
            
            if index == 0 {
                tempButton2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
            } else {
                tempButton2.transform = .init(scaleX: 0.3, y: 0.3)
            }
        }
         buttons2.reverse()
        for button2 in buttons2 { view.addSubview(button2)}
         buttons2.reverse()
    
    }
    
    
    @objc func didTapButton() {
        for (index, button) in buttons.enumerated() {
            if index != 0, isBack == false {
                UIView.animate(withDuration:0.4, delay: 0, animations: {
                    button.center.y -= (CGFloat(index) * Padding.itemSpace)
                    button.transform = .identity

                })
            } else if index != 0, isBack == true {
                UIView.animate(withDuration:0.4, delay: 0, animations: {
                    button.center.y += (CGFloat(index) * Padding.itemSpace)
                    button.transform = .init(scaleX: 0.3, y: 0.3)
                })
            }
        }
        isBack.toggle()
        print("1111",isBack)
    }
    @objc func didTapButton2() {
        for (index, button) in buttons2.enumerated() {
            if index != 0, isBack2 == false {
                print("2222", isBack2)
                UIView.animate(withDuration:0.4, delay: 0, animations: {
                    button.center.y -= (CGFloat(index) * Padding.itemSpace)
                    button.transform = .identity
                    
                })
            } else if index != 0, isBack2 == true {
                UIView.animate(withDuration:0.4, delay: 0, animations: {
                    button.center.y += (CGFloat(index) * Padding.itemSpace)
                    button.transform = .init(scaleX: 0.3, y: 0.3)
                })
            }
        }
        isBack2.toggle()
        print("2222",isBack2)
    }
}
        


