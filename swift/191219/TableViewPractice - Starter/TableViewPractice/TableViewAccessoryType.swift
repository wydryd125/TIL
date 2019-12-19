//
//  TableViewAccessoryType.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewAccessoryType: UIViewController {
    
    /***************************************************
     - 미리 정해진 동물의 이미지와 텍스트를 테이블뷰에 표현
     - 각 셀의 크기는 80
     - 셀을 선택하면 체크박스가 나타나고 다시 선택하면 체크표시가 해제되도록 구현
     
     도전 과제)
     테이블뷰의 각 셀을 위아래로 스크롤 했다가 다시 나타낼 때, 체크 표시가 기존에 했던 곳에 정확히 다시 나타나도록 구현
     ***************************************************/
    
    override var description: String {
        return "Task 2 - AccessoryType"
    }
    
    let animals = [
        "bear", "buffalo", "camel", "dog", "elephant", "llama", "panda", "lion", "horse",
        "guinea_pig", "koala", "whale_shark", "whale", "duck",
        "seagull", "black_swan", "peacock", "giraffe"
    ]
    // 5. 체크할 수 있는 bool값의 빈 배열을 만들어줌.
    var animals2: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. tableView 만들어주고 UI 잡음.
        let tableView = UITableView(frame: view.frame)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        tableView.frame = view.frame
        //2. datasouce와 delegate사용을 위해 작성
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.rowHeight = 80
       
        //6. 조건문으로 animal 배열값의 갯수만큼 animals배열에 false 추가
        //(animals가 20개면 animals2도 20개)
        for _ in 0...animals.count - 1 {
            animals2.append(false)
        }
    }
}

// 3. tableview의 datasource
extension TableViewAccessoryType: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        print("셀적용", indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        // 7. 셀에 이미지와 텍스트를 넣어줌
        cell.textLabel?.text = animals[indexPath.row]
        cell.imageView?.image = UIImage(named: animals[indexPath.row])
        
        //8. animals[index.row]의 값을 뽑아 true이면
        if animals2[indexPath.row] == true {
            //  checkmark 표시를 하겠다
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}
//4. delegate 구현
extension TableViewAccessoryType: UITableViewDelegate {
    //9. didSelectRowAt - 셀 선택했을때 무언가 이루어짐~
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //10. animals2의 인덱스 값이 true이면 -> 클릭 후 false로 바꾸고, reloadRows하겠다.
        if animals2[indexPath.row] == true {
            animals2[indexPath.row] = false
            tableView.reloadRows(at: [indexPath], with: .automatic)
        // 아니면 false -> 클릭 후 true, reloadRows 하겠다.
        } else {
            animals2[indexPath.row] = true
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        print("index", indexPath.row)
        print(animals[indexPath.row])
        print(animals2[indexPath.row])
    }
}

