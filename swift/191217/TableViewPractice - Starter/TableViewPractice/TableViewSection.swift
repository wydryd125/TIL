//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :  0 부터  100 사이에 임의의 숫자
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     e.g.
     섹션 0 - 0부터 9까지의 숫자
     섹션 1 - 10부터 19까지의 숫자
     ***************************************************/
    
    override var description: String { "Practice 2 - Section" }
    
//    let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    var resultDict = [Int: [Int]]()
    let data = Array(0...100)
    var keys = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sort()
        
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
        
    }
    
    func sort() {
        for i in data {
            let key = i / 10
            
            if var value = resultDict[key] { // [0: [1...9], 1: [10, 11]]
                value.append(i) // [0, 1, 2 ... 9]
                resultDict[key] = value
                
            } else {
                resultDict[key] = [i] // [0: [0]] [1: [10]] [2: [20]]
            }
        }
        
        keys = resultDict.keys.sorted()
    }
    
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let value = resultDict[key]!
        return value.count
        
        return resultDict[keys[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        let key = keys[indexPath.section]
        let value = resultDict[key]!
        cell.textLabel?.text = String(value[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(keys[section])
    }
}
