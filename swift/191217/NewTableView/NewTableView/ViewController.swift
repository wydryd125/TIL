//
//  ViewController.swift
//  NewTableView
//
//  Created by 정유경 on 2019/12/17.
//  Copyright © 2019 정유경. All rights reserved.
//


//!!!!!!!!!!!!!!!!!!!!!!!!!!!! 코드로 테이블뷰 만들기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
import UIKit

class ViewController: UIViewController {

    let data = Array(1...40)
    
    //-> 테이블 뷰 생성
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //-> 셀을 새로 생성하지 않고 재사용하기 위해 register를 써줌. 아이덴티파이어의 이름으로 찾아서 재사용시켜줌
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //-> 테이블 뷰를 보여지게 하려면 꼭 dataSource를 작성해야함.
        tableView.dataSource = self
        
        //-> 테이블뷰의 프레임을 뷰의 프레임과 같게 함.
        tableView.frame = view.frame
        
        //-> 뷰에 테이블뷰를 얹어줌.
        view.addSubview(tableView)
        
        
    }


}
//-> 테이블뷰는 델리게이트 방식이기 때문에 사용할때 익스텐션을 사용해야함. 익스텐션 사용하면 밑에 함수는 자동 생성됨.
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //-> 테이블뷰의 재사용하는 셀의 아이덴티파이어를 cell이라고 함.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(data[indexPath.row])
        return cell
    }
    
}
