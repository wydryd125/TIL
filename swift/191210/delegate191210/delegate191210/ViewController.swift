//
//  ViewController.swift
//  delegate191210
//
//  Created by 정유경 on 2019/12/10.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myView: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .blue
        myView.backgroundColor = .red
        myView.backgroundColor = nil
        
      //  2. delegate = self
        myView.delegate = self // -> self = viewController
        
        myView.backgroundColor = .red
   
        
    }
}
//1. 프로토콜 체택
extension ViewController: CustomViewDelegate {
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else { return .black }
        return color == .red ? .blue : color
    }
}
