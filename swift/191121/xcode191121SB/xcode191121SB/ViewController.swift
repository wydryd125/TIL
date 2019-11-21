//
//  ViewController.swift
//  xcode191121SB
//
//  Created by 정유경 on 2019/11/21.
//  Copyright © 2019 jeongyukyung. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var number: UILabel!
    var count = 0
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func minusTap(_ sender: UIButton) {
        print("minus")
        count -= 1
        number.text = String(count)
        number.textColor = .systemRed
        
    }
    
    @IBAction func plusTap(_ sender: UIButton) {
        print("plus")
        count += 1
        number.text = String(count)
        number.textColor = .blue
    }
}

