//
//  ViewController.swift
//  Navigation
//
//  Created by 정유경 on 2019/12/23.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // code로 네비게이션 컨트롤러 만들기 SceneDel 갔다가 2
      
        view.backgroundColor = .yellow
        //->iOS 11 이상, 글자 크기 키우기
        navigationController?.navigationBar.prefersLargeTitles = true
        //-> 글자크기 크게 사용 하지 안겠다,
//        navigationItem.largeTitleDisplayMode = .never
        
        title = "FirstVC"
    
        
        
        let barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))
        //-> 바버튼을 카메라 모양으로
        let barButtonItem2 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(pushViewController(_:)))
        //-> 네비게이션 button 한개만
//        navigationItem.rightBarButtonItem = barButtonItem
        //-> 오른쪽 네비게이션 button 여러개
        navigationItem.rightBarButtonItems = [barButtonItem,barButtonItem2]

        
    }
    @objc private func pushViewController(_ sender: Any){
        let secondVC = SecondViewController()
//        show(secondVC, sender: sender)
        //-> show는 push와 present를 모두 사용할수 있고,
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        //-> 맨처음 기본적으로 세팅되어있는 viewcontoroller를 가져옴,
////        let initialVC = storybord.instantiateInitialViewController()
//        let secondVC = storybord.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

        
//        show(secondVC, sender: nil)
    
//        //-> push나 present 둘 중에 골라서 사용하면됨
//        navigationController?.pushViewController(secondVC, animated: true)
 
//        navigationController?.popViewController(animated: true)
//        //-> 제일 처음으로 가고싶을때!
//        navigationController?.popToRootViewController(animated: true)
    }
    
// code로 만들때
    //   let secondVC = SecondViewController()
    //        show(secondVC, sender: nil)
    


}

