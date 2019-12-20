//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    //-> 1. 결과값과 화면에 나오는 값. 현재 계산기의 값이 0이기 때문에 초기값은 0,그리고 그 값이 바뀔 때마다 라벨의 값이 바뀜
    var disNum = "0" {
        //-> 2. disNum 값이 변경될 때 마다 호출됨.
        willSet {
            numberOutputLabel.text = newValue
        }
    }
    
    //-> 3. 임시의 저장값. 기존에 계산한 값이 새로운 값이 들어오면 없어지니까 임시의 방에 넣어준다.
    var tempNum = "0"
    
    //-> 4. 연산자를 저장함.
    var oper = 0
    
    //-> 5. newEdit - 새로운 값을 받기위해 기존 값을 임시 저장하는 곳에 옮겨두고 새로운 값을 저장하도록 세팅함.
    var newEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 24
        }
    }
    
    
    @IBAction func numberButton(_ sender: UIButton) {
        
        // 7. 만약 newEdit이 true면 tempNum에 disNum(화면에 보여질 값)을 넣고 disNum에 다시 0을 넣어줌. -> 이렇게 해야 계산할 두번째 값을 받을 수 있으니까요요용용
        if newEdit {
            tempNum = disNum
            disNum = "0"
            //-> false로 바꿔야 조건문이 다시 실행하지 않아서!
            newEdit = false
        }
        
        // -> 6. 초기 디스플레이 숫자가 0일때
        if disNum == "0" {
            //-> 0의 중복을 막는당.
            disNum = ""
        }
        //-> 빈방에 입력한 값을 넣어줌.
        disNum += String(sender.tag)
        
        
    }
    
    //-> 8. 계산버튼
    @IBAction func functionButton(_ sender: UIButton) {
        //-> 만약 연산자가 0이 아니면
        if oper != 0 {
            //-> operation 함수를 실행
            operation()
        }
     //-> oper가 0이든 0이 아니든 실행되는 구문
        //-> 눌러진 연산자 태그를 저장
        oper = sender.tag
        //-> 연산자가 저장되었기 떄문에 새로운 숫자를 받게함.
        newEdit = true
    }
    
    //-> 9. 연산함수
    func operation() {
        //-> 기존에 저장된 수와 현재의 수를 double 타입으로 바꿔쭘
        guard let dis = Double(disNum), let temp = Double(tempNum) else { return }
        
        //-> 결과값이 저장
        let result: Double
        
        //-> 연산자 태그에 맞게 밑에 구문 실행
        switch oper {
        case 100:
            result = temp + dis
            
        case 101:
            result = temp - dis
            
        case 102:
            result = temp * dis
            
        default:
            result = temp / dis
        }
        
        //-> 문자로 결과값을 변경하여 화면에 표시
        disNum = String(result)
        //-> 새로운값을 받기 위한 설정
        newEdit = true
    }
    
    //-> 10. = 버튼을 눌렀을때
    @IBAction func equal(_ sender: UIButton) {
        //-> oper 함수 실행
        operation()
        
    }
    //-> AC 버튼을 눌렀을떄
    @IBAction func allclear(_ sender: UIButton) {
       //-> 화면에 보여질 값은 0
        disNum = "0"
        //-> 연산자도 0으로 바꿔서 연산할수 없게 한다.
        oper = 0
    }
    
    
}
