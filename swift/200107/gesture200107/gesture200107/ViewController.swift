//
//  ViewController.swift
//  gesture과제200107
//
//  Created by 정유경 on 2020/01/07.
//  Copyright © 2020 정유경. All rights reserved.
//

/**********************************************
 [ 과제 ]
  1. 샘플 영상을 보고 동일하게 동작하도록 구현
-  touchesBegan 메서드 이용
- UITapGestureRecognizer 이용
  이전에 탭한 위치에서 거리가 10 이상이면 새로운 탭인 것으로 계산
- UIGestureRecognizerDelegate의 shouldReceive 메서드 이용
 *********************************************/

import UIKit

class ViewController: UIViewController {
    
    let countLabel = UILabel()
    var count = 0
    let coordinateLabel = UILabel()
    var coordinateX = CGFloat()
    var coordinateY = CGFloat()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseUI()
        autoLayout()
        
    }
    func baseUI() {
        
        countLabel.text = "횟수: \(count)"
        countLabel.backgroundColor = .white
        countLabel.textColor = .black
        countLabel.font = .boldSystemFont(ofSize: 20)
        view.addSubview(countLabel)
        
        coordinateLabel.text = "좌표: 0.0 , 0.0"
        coordinateLabel.backgroundColor = .white
        coordinateLabel.textColor = .black
        coordinateLabel.font = .boldSystemFont(ofSize: 20)
        view.addSubview(coordinateLabel)

    }
    func autoLayout() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 50).isActive = true
        countLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        countLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        coordinateLabel.translatesAutoresizingMaskIntoConstraints = false
        coordinateLabel.leadingAnchor.constraint(equalTo: countLabel.leadingAnchor).isActive = true
        coordinateLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 30).isActive = true
        coordinateLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        coordinateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
  
    // View touch가 시작될 때 한 번만 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("touch")
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: touch.view)
       
        // NumberFormatter - 소수점 갯수조절 메서드 최소, 최대 소수점 한자리까지 보여지게하겠다.
        let formetter = NumberFormatter()
        formetter.minimumFractionDigits = 1
        formetter.maximumFractionDigits = 1
        
        // numberX,Y에 좌표를 형변환하여 넣어줌
        guard let numberX = formetter.string(from: touchPoint.x as NSNumber) else { return }
        guard let numberY = formetter.string(from: touchPoint.y as NSNumber) else { return }

        // x,y에 현재값-이전값 한 값을 넣어줌
        let x = touchPoint.x - coordinateX
        let y = touchPoint.y - coordinateY
        print(x,y)
       
        // 피타고라스 정리를 이용하여 대각선 좌표의 길이까지 구함. - (A제곱 + B제곱 = C제곱)
        let c = pow(x, 2) + pow(y, 2)
        
        // 제곱값을 루트로 벗겨내주고, 그 값이 10보다 같거나 크면 카운트수 증가, 아니면 1로 리셋
        if c.squareRoot() >= 10 {
            count = 1
            countLabel.text = "횟수 : \(count)"
        } else {
            count += 1
            countLabel.text = "횟수 : \(count)"
        }
        
        coordinateLabel.text = "좌표 : \(numberX) , \(numberY)"
        
        coordinateX = touchPoint.x
        coordinateY = touchPoint.y
        
    }
    
    
}


