//
//  ViewController.swift
//  TextfieldDelegate
//
//  Created by 정유경 on 2019/12/10.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var textField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //-> 키보드를 내리는 메서드
        return true
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        // -> true는 값이 밑에 출력됨 밑에코드는 a면 출력하지 않고 다른것은 출력하겠다는 것
//
//        return string == "a" ? false : true
//    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
       
        
        if textField.text == "red" {
            myView.backgroundColor = .red
        } else if textField.text == "blue" {
            myView.backgroundColor = .blue
        } else if textField.text == "black" {
            myView.backgroundColor = .black
        } else {
            myView.backgroundColor = .gray
        }
        
        
    }
  

}
