//
//  ViewController.swift
//  xcode_191122SB
//
//  Created by 정유경 on 2019/11/22.
//  Copyright © 2019 jeongyukyung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var onOff: UILabel!
    @IBOutlet weak var btn: UISwitch!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        print("ON!","OFF!")
        
        if btn.isOn {
            onOff.text = "ON!"
        } else {
            onOff.text = "OFF!"
        }
}
    @IBAction func seg(_ sender: UISegmentedControl) {
        
        if segment.selectedSegmentIndex == 0 {
            onOff.textColor = .blue
        } else {
            onOff.textColor = .red
        }
    
    }
    
}
