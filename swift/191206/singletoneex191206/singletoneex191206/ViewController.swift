//
//  ViewController.swift
//  singletoneex191206
//
//  Created by 정유경 on 2019/12/06.
//  Copyright © 2019 정유경. All rights reserved.
//

/*[ 과제 ]
 1.
 FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
 - UserDefaults 를 이용한 방법으로 전달
 - Singleton 을 이용한 방법으로 전달 */

import UIKit

class ViewController: UIViewController {
    //-> 뷰에 보여지는 텍스트필드
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //-> prepare = 세그를 관리하는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // -> 세그의 아이덴티파이어가
        switch segue.identifier {
        case "user": //->유저면
            guard let text = textField.text else { return }
            UserDefaults.standard.set(text, forKey: "text1")
            // -> 텍스트필드의 텍스트를 가져와서 유저디폴트에 저장함
        case "Singleton": //-> 세그의 아이덴티파이어가 싱글톤이면
            guard let text = textField.text else { return }
            Singleton.shared.text = text
            // -> 싱글톤 클래스의 쉐어드, 텍스트에 저장함.
            
            break
            
            
            
        default :
            break
        }
    }
}


