//
//  ViewController.swift
//  xcode_191121(code)
//
//  Created by 정유경 on 2019/11/21.
//  Copyright © 2019 jeongyukyung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let number = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let plus = UIButton(type: .system)
        //    plus.tintColor = .purple
        plus.frame = CGRect(x: 276, y: 628, width: 50, height: 50)
        plus.setTitle("plus", for: .normal)
        view.addSubview(plus)
        plus.addTarget(self, action: #selector(tapPlus), for: .touchUpInside)
        
        let minus = UIButton(type: .system)
        //    minus.tintColor = .yellow
        minus.frame = CGRect(x: 89, y: 628, width: 50, height: 50)
        minus.setTitle("minus", for: .normal)
        view.addSubview(minus)
        minus.addTarget(self, action: #selector(tapMinus), for: .touchUpInside)
        
        
        number.frame = CGRect(x: 186, y: 223, width: 80, height: 80)
        number.text = "1"
        view.addSubview(number)
        
        
        

    
        
    }
    
    var count = 1
    @objc func tapPlus() {
        print("plus")
        count += 1
        number.text = String(count)
        number.textColor = .blue
    }
    @objc func tapMinus() {
        print("minus")
        count -= 1
        number.text = String(count)
        number.textColor = .red
    }
}

