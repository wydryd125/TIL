//
//  SecondViewController.swift
//  xcode191203
//
//  Created by 정유경 on 2019/12/03.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var label: UILabel!
    var text = ""
    var count = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.text = String(count)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToSecondVC(_ unwindSegue: UIStoryboardSegue) {
        //        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
        
    
}
