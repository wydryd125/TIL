//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
    var isQuadruple = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.clipsToBounds = true
    
    
    
  }
    @IBAction func handleGesture(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else { return }
        
        if !isQuadruple {
            //-> 이미지의 크기를 4배키우겠다 (2*2)
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
            //-> y축으로 100 이동하겠다
        // imageView.transform = imageView.transform.translatedBy(x: 0, y: 100)
            
        } else {
             //CGAffineTransform 원래 사이즈로 돌리는 것
            imageView.transform = CGAffineTransform.identity
        }
        isQuadruple.toggle()
        print("tap")
       
        
    }
   
    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        print("rotation")
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
        print(imageView.transform)
        
    }
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        print("swipe")
        
        switch isQuadruple {
        case true :
            sender.direction = .left
            imageView.image = UIImage(named: "cat2")
        case false :
            sender.direction = .right
            imageView.image = UIImage(named: "cat1")
        }
        isQuadruple.toggle()
        
// if문으로 썼을때
        //        if sender.direction == .left {
//            imageView.image = UIImage(named: "cat1")
//            sender.direction = .right
//        } else {
//            imageView.image = UIImage(named: "cat2")
//            sender.direction = .left
//        }

    }
    var initialCenter = CGPoint()
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        print("pan")
        
        //        let transtion = sender.translation(in: imageView)
        //        let changedX = imageView.center.x + transtion.x
        //        let chagnedY = imageView.center.y + transtion.y
        //        imageView.center = CGPoint(x: changedX, y: chagnedY)
        
        
        guard let dragView = sender.view else { return }
        
        let transtion = sender.translation(in: dragView.superview)
        if sender.state == .began {
            initialCenter = dragView.center
        }
        if sender.state != .cancelled {
            dragView.center = CGPoint(x: initialCenter.x + transtion.x,
                                      y: initialCenter.y + transtion.y)
        } else {
            dragView.center = initialCenter
        }
    }
}
