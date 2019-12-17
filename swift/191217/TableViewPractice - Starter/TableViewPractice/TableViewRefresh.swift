//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    //-> maxCount는 cell에 보여주고싶은 숫자의 갯수
    let maxCount = 20
    
    //-> resultArr는 랜덤한 수를 담아두기 위한 방
    var resultArr = [Int]()
    
    //-> 테이블뷰를 생성하였고 프로퍼티로 만듦
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        random()
        setupTableView()
        
        // 네비게이션 컨트롤러 오른쪽에 사용할 버튼 생성함.
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "(>_<)/",
            style: .plain,
            target: self,
            action: #selector(reloadData)
        )
        
    }
    
    //-> 랜덤한 숫자를 뽑기위한 함수
    func random() {
        //-> 랜덤한 숫자가 저장되어있는 방을 모조리 비움. 왜냐면 리프레쉬버튼 눌렀을때 또 다른 랜덤의 숫자가 들어와야 하기 때문에
        resultArr.removeAll()
        
        //-> tempArr에 array 안 숫자, 즉 1~70의 숫자를 넣어줌
        let tempArr = Array(1...(maxCount + 50))
        
        //-> 우리가 원하는 조건이 될때까지 for문을 무한으로 돌리기 위해 0다음 숫자 안써줌. 무한정 뽑아내겠다는 것...
        //-> 와일드카드로 쓴 이유는 조건문 안에서 쓸 일이 없기 떄문에
        for _ in 0... {
            
            //-> randomElenment 가 옵셔널 Int로 반환하기 때문에 옵셔널바인딩 사용!! 그래서 guard
            //-> tempNumber의 방에 tempArr(1~70)의 랜덤한 숫자가 들어감.
            guard let tempNumber = tempArr.randomElement() else { return }
            
            //-> tempNumber의 숫자가 resultArr와 같지 않다면
            if !resultArr.contains(tempNumber) {
                //-> 그 숫자를 resultArr에 추가함.
                resultArr.append(tempNumber)
            }
            //-> maxcount와 resultArr의 숫자가 같다면 멈춰라 (20개)
            if maxCount == resultArr.count {
                break
            }
        }
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CallID")
        view.addSubview(tableView)
        
        
        let refrashController = UIRefreshControl()
        refrashController.tintColor = .green
        refrashController.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        //->테이블뷰에 리프레쉬컨트롤러를 올려줌
        tableView.refreshControl = refrashController
        
    } 
    @objc func reloadData() {
        random()
        tableView.refreshControl?.endRefreshing() //-> 빙글빙글 도는 컨트롤러를 멈추겠다는것
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource


extension TableViewRefresh: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
        cell.textLabel?.text = "\(resultArr[indexPath.row])"
        return cell
        
        
    }
    
}


//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
//    return cell
//  }

