//
//  SingletonViewController.swift
//  singletoneex191206
//
//  Created by 정유경 on 2019/12/08.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class SingletonViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //-> 싱글톤에 저장한 텍스트를 레이블 텍스트에 넣어준다.
        label.text = Singleton.shared.text

        
    }

}
