//
//  FirstViewController.swift
//  xcode191203
//
//  Created by 정유경 on 2019/12/03.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var count = 0 {
        willSet { // 해당값이 변경될 떄마다 실행됨
            print("\(newValue)")
            label.text = String(newValue)
        }
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        //        return true // false-> 버튼을 눌러도 화면전환이 안됨.
        // count값이 40이 넘어가면 화면전환이 안되게 하고 그 이전까지는 화면전환 되게
        
        
        //        if identifier == "Card" && count + 1 <= 40  {
        //            return true
        //        } else if identifier == "FullScreen" && count + 10 <= 40 {
        //            return true
        //        } else {
        //            return false
        //        }
        
        var temp = 0
        
        if identifier == "Card" {
            temp = count + 1
        } else {
            temp = count + 10
        }
        
        if temp > 40 {
            return false
        } else {
            count = temp
            return true
        }
        
        
    }
    
    
    //위에 코드를 아래처럼 쓸수도 있음.
    //    super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
    //    let plus = identifier == "Card" ? 1 : 10
    //    return count + plus <= 40
    // }
    
    //Actionsegue : ShouldPerform -> prepare
    //ManualSegue : performSegue -> prepare
    //-> actionsegue만 shouldperform을 호출하기 때문에 manualsegue는 shouldperform에 있는 조건을 실행하지 못한다.
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // prepare -> 모든 뷰컨틀롤러에 있는 segue가 prepare를 통과. prepare가 segue를 관리함.
        //        segue.destination // 목적지, 세컨뷰
        //        segue.source // 출발지, 퍼스트뷰
        //        segue.identifier // 카드 or 풀스크린
        guard let secondVC = segue.destination as? SecondViewController else{return}
        
        if segue.identifier == "Card" {
            
            //            count += 1
            secondVC.count = count
            //            label.text = "\(count)"
            
        } else if segue.identifier == "PlusFive" {
            //            count += 10
            count += 5
            secondVC.count = count
            // -> plusFive는 슈드퍼폼 호출하지 못하여 프리페어 안에서 조건 작성
            //            label.text = "\(count)"
        } else {
            secondVC.count = count
        }
        
        //        switch segue.identifier {
        //        case "":
        //            <#code#>
        //        default:
        //            <#code#>
        //        }
        //
    }
    
    
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        //-> unwind -> 돌아와야하는!! Dismiss, 등대같은 함수
        let source = unwindSegue.source
        let destination = unwindSegue.destination
        print("출발\(source), 도착\(destination)")
        
        guard let secondVC = unwindSegue.source as? SecondViewController else {return}
        
        guard let text = secondVC.textfield.text else { return }
        guard let num = Int(text) else { return }
        
        count -= num
        //        label.text = String(count)
    }
    
    @IBAction func plusFive(_ sender: Any) {
        
        if (count + 5) <= 40 {
              performSegue(withIdentifier: "PlusFive", sender: sender)
        }
        
    }
}
//-> button +5는 메뉴얼세그이기 때문에 슈드퍼폼 부분은 호출하지 못하므로 플러스파이브 내의 퍼폼세그에서 조건을 작성해주어야 함.

