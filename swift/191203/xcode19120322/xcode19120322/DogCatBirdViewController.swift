//
//  DogCatBirdViewController.swift
//  xcode19120322
//
//  Created by 정유경 on 2019/12/03.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class DogCatBirdViewController: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    
    var imageName = "" // -> 두번째 뷰의 이미지를 바꾸기 위해 만들어낸 변수
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Image.image = UIImage(named: imageName) //-> 이미지뷰의 이미지를 UI이미지의 이미지네임으로 변경시키겠다.
        print(imageName)
    }
    
    @IBAction func allPlus(_ sender: Any) {
        
        
        
    }
    
//    @IBAction func unwindToDismiss(_ unwindSegue: UIStoryboardSegue) {
        
        
        
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
}

