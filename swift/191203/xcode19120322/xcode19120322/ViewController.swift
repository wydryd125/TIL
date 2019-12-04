//
//  ViewController.swift
//  xcode19120322
//
//  Created by 정유경 on 2019/12/03.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit
//-> 첫 화면
class ViewController: UIViewController {
    //-> 개 고양이 새 갯수가 들어있는 레이블
    @IBOutlet weak var DogCatBird: UILabel!
    //-> 개 고양이 새의 갯수 저장방
    var dogCount = 0
    var catCount = 0
    var birdCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-> 선언된 함수를 호출하겠다.
        textChange()
        
    }
    
    
    // -> 슈드퍼폼 - 세그로 버튼을 눌렀을 때 프리페어 단계로 가기전에 들르는 곳, ture면 프리페어 실행하고, false는 프리페어까지 가지 않음.
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        
        //-> 개 고양이 새의 카운트가 들어가는 임시 방
        var count = 0
        
        //-> 아이덴티파이어에 따라서 밑에 조건문 실행
        switch identifier {
        case "Dog": //-> 도그를 클릭!
            count = dogCount + 1 //-> 카운트에 도그카운트 + 1이 저장
            if count > 8 { // -> 그 카운트가 8보다 크면 false (false는 화며전환X)
                return false
            } else { //-> 카운트가 8보다 작으면 ture (true면 밑에 코드로 진행~)
                return true
            }
            
        case "Cat":
            count = catCount + 1
            if count > 10 {
                return false
            } else {
                return true
            }
            
        default:
            count = birdCount + 1
            if count > 15 {
                return false
            } else {
                return true
            }
        }
        
    }
    
    func textChange() {
        DogCatBird.text = "Dog: \(dogCount)  Cat: \(catCount)  bird: \(birdCount)"
    }
    
    //-> 슈드퍼폼 조건이 true일 때 실행됨.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //-> 세그의 도착지가 개고양이새뷰가 맞으면 dogCatBird에 개고양이새뷰컨트롤러를 넣어 사용
        guard let dogCatBird = segue.destination as? DogCatBirdViewController else { return }
        //-> 세그의 아이덴티파이어가~~~~~
        switch segue.identifier {
        case "Dog": //-> 도그면
        //-> 도그캣버드의 이미지를 도그도그로 바꾸겠다.
            dogCatBird.imageName = "dogdog"
        case "Cat":
            dogCatBird.imageName = "catcat"
        default:
            dogCatBird.imageName = "birdbird"
        }
        
        
        
    }
    //-> 돌아와야한는 곳 1
    @IBAction func unwindToView(_ unwindSegue: UIStoryboardSegue) {
        
        let source = unwindSegue.source
        let destination = unwindSegue.destination

        //print("출발 \(source), 도착 \(destination)")
        
        //-> 돌아오는 세그의 출발이 개고양이새 뷰컨트롤러가 맞나? 맞으면 dogCatBird에 넣어서 사용
        guard let dogCatBird = unwindSegue.source as? DogCatBirdViewController else { return }
       
        //-> 도그캣버드컨드롤러의 이미지가~~
        switch dogCatBird.imageName {
        case "dogdog": //-> 도그이면 도그+1
            dogCount += 1
        case "catcat":
            catCount += 1
        default:
            birdCount += 1
        }
        
        //-> 화면에 보여주어야하기 떄문에 다시 작성
       textChange()

    
}
//->돌아와야하는 곳2
@IBAction func unwindToAllPlus(_ unwindSegue: UIStoryboardSegue) {
    let sourceViewController = unwindSegue.source
    //-> 개 고양이 새 전부 플러스 1 해줘야 하는 곳
    dogCount += 1
    catCount += 1
    birdCount += 1
    //->화면에 보여주어야하기 떄문에 호출
    textChange()
    
}

}
