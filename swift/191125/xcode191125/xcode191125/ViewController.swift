//
//  ViewController.swift
//  xcode191125
//
//  Created by 정유경 on 2019/11/25.
//  Copyright © 2019 jeongyukyung. All rights reserved.
//


/*[ 과제 ]
1. ViewController 데이터 전달
  > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
  > A와 B를 화면 전환할 때마다 각 Label에 전환 횟수 1씩 증가
    e.g. A에서 B로 갈 때 1, B에서 다시 A로 넘어올 때 2, 다시 A에서 B로 가면 3

*/


import UIKit

class ViewController: UIViewController {
    
    let tag = "첫번째 뷰"
    let number = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tag+"view Did Load")
        setupUI()
        
    }
    
    func setupUI() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemGroupedBackground
        } else {
            view.backgroundColor = .white
        }
        let button = UIButton(type: .system)
        button.frame.size = CGSize(width: 100, height: 50)
        button.center = view.center
        button.setTitle("클릭!", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
    
        number.frame = CGRect(x: 200, y: 200, width: 100, height: 50)
        number.font = UIFont.systemFont(ofSize: 50)
        //number.text = "\(count)"
        view.addSubview(number)
        
        
        
   
    }
    var count = 1
    @objc private func didTapButton(_ sender: UIButton) {
        
        let secondVC = secondViewController()
        secondVC.secondCount = count + 1
        secondVC.modalPresentationStyle = .fullScreen
//        secondVC.view.backgroundColor = .purple
        
        
        present(secondVC, animated: true)
        
//        guard let vc = presentingViewController as? ViewController else {return}
//     
//         
//        
//        dismiss(animated: true)
        
    }
   
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(tag+"view Will Appear")
        number.text = "\(count)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(tag+"view Did Appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(tag+"view Will Disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(tag+"view Did Disappear")
    }


}

