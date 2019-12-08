//
//  secondVC.swift
//  singletoneex191206
//
//  Created by 정유경 on 2019/12/06.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        guard let text = UserDefaults.standard.string(forKey: "text1") else { return }
        textLabel.text = text
        

      }


}
