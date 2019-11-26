//
//  ViewController.swift
//  xcode191126
//
//  Created by 정유경 on 2019/11/26.
//  Copyright © 2019 jeongyukyung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let text = UITextField()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        text.frame.size = CGSize(width: view.frame.size.width - 100, height: 30)
        //-> width뒤에 -100은 그만큼의 사이즈를 줄이겠다는 것.
        text.center = view.center
        text.borderStyle = .line
        //-> 테두리를 어떤 형식으로 할것인가?
        text.addTarget(self, action: #selector(copyWord(_:)), for: .editingChanged)
        //-> editingChanged(textfield의 이벤트) - 입력되고 있을 때(= 바뀌고 있을 때)
        text.addTarget(self, action: #selector(deActive(_:)), for: .editingDidEnd)
        //-> editingDidEnd(textfield의 이벤트) - 입력되고 끝날 때 호출
        text.addTarget(self, action: #selector(primary(_:)), for: .primaryActionTriggered)
        //-> primaryActionTriggered(textfield의 이벤트) - 엔터키를 눌렀을때 호출
        view.addSubview(text)
        //-> addtarget 이란? 어떠한 이벤트가 일어날 때 실행되어야 할 함수를 명시 해줄 때 사용한다.
        
        label.frame = CGRect(x: view.center.x - 150, y: 350, width: 300, height: 50)
        label.text = ""
        label.backgroundColor = .systemYellow
        view.addSubview(label)
    }
    
    @objc func copyWord(_ sender: UITextField) {
        print("난따라할고얌")
        label.text = sender.text
        label.font = .systemFont(ofSize: 40)
        label.textColor = .systemBlue
        
    }
    
    @objc func deActive(_ sender: UITextField) {
        //-> sender - addtarget한 버튼,테스트(객체)를 sender를 통해서 사용할 수 있음.
        print("비활성화주우우웅")
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemRed
    }
    
    @objc func primary(_ sender: UITextField) {
        print("엔터쳤다!!")
        sender.resignFirstResponder()
        // -> 엔터치면 키보드가 사라짐.
    }
    
//    sender.resignFirstResponder()
    
    
    


}

