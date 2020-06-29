//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
    var isHoldingImage = false
    var lastTouchPoint = CGPoint()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.layer.cornerRadius = imageView.frame.width / 2
//    이미지를 둥글게 만듦
    imageView.clipsToBounds = true

  }
    //클릭한 직후
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)

        if imageView.frame.contains(touchPoint) {
            imageView.image = UIImage(named: "cat1")
        }
        isHoldingImage = true
        lastTouchPoint = touchPoint
        print("touch Point")
    }
   // 클릭한 상태로 이동
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard isHoldingImage, let touch = touches.first else { return }

        let touchPoint = touch.location(in: touch.view)
//        imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)
//        imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
//        lastTouchPoint = touchPoint
//
        let prevTouchPoint = touch.previousLocation(in: touch.view)
        imageView.center.x = imageView.center.x + (touchPoint.x - lastTouchPoint.x)
        imageView.center.y = imageView.center.y + (touchPoint.y - lastTouchPoint.y)
        lastTouchPoint = touchPoint


//        imageView.center = touchPoint
//        if imageView.frame.contains(touchPoint) {
//        imageView.center = touchPoint
//        }



        print("--------[touches Moved]---------")

    }
    //손을 뗀상태
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        imageView.image = UIImage(named: "cat2")
        isHoldingImage = false
        lastTouchPoint = touchPoint
        print("--------[touches Ended]---------")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
        imageView.image = UIImage(named: "cat1")
        isHoldingImage = false
        lastTouchPoint = touchPoint
    }

}
