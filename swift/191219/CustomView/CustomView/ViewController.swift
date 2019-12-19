//
//  ViewController.swift
//  CustomView
//
//  Created by 정유경 on 2019/12/19.
//  Copyright © 2019 정유경. All rights reserved.
//


// !!!!!!!!!!!!!!!!!!!!!버튼으로 셀의 로우값 변경하기 (+1)!!!!!!!!!!!!!!!!!!!!!!!!!!!!


import UIKit

class ViewController: UIViewController {
    //-> 1. 테이블뷰 생성
    let tableView = UITableView()
    
    //-> 2. 셀의 로우값 0~100
    var data = Array(0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-> 3. 셀을 재사용 하기위해 레지스터 사용, 아이덴티파이어의 이름으로 사용된 셀을 찾아서 재사용 시켜줌
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CellID")
        
        //-> 3. 테이블 뷰를 보여지게 하려면 데이터소스를 꼭 작성해야함
        tableView.dataSource = self
        
        //-> 3. 테이블뷰의 크기를 뷰의 크기로 하겠음.
        tableView.frame = view.frame
        view.addSubview(tableView)
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //-> 4. 보여지는 셀의 갯수만 확인
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //-> 9. 테이블뷰에 등록한 커스텀셀의 생성함
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? CustomCell else { fatalError() }
        
        //-> 셀의 정보를 입력
        cell.textLabel?.text = String(data[indexPath.row])
        
        //-> 셀의 델리게이트를 쓰기위해서 셀이 생성되는 곳에서 작성함.
        cell.delegate = self
        
        return cell //- 여기까지가 9
    }
}

//-> 10. 커스텀셀의 델리게이트를 사용하기 위한... 구현부
extension ViewController: CustomCellDelegate {
    
    //-> 셀에서 버튼을 눌렀을때 델리게이트를 통해 해야할 일을 구현해준곳
    //-> 함수를 통해 그 셀의 정보를 가져옴
    func didTapButton(cell: CustomCell) {
        
        //-> 해당 셀의 주소를 받아와 테이블뷰에게 인덱스패스를 받아옴
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        //-> 받아온 인덱스패스를 통해 로우 번째의 데이터의 값을 변경함.
        var value = data[indexPath.row]
        value += 1
        data[indexPath.row] = value
        
        cell.textLabel?.text = String(value)
        
    } //- 여기까지 10
}


