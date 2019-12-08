//
//  STViewController.swift
//  SingletonUD
//
//  Created by 정유경 on 2019/12/08.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class STViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        label.frame.size = CGSize(width: 300, height: 40)
        label.center = view.center
        label.backgroundColor = .red
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        view.addSubview(label)
        label.text = Singleton.shared.text
    
    }
    

}
