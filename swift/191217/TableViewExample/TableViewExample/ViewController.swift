//
//  ViewController.swift
//  TableViewExample
//
//  Created by 정유경 on 2019/12/17.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // 하나의 섹션에 몇 개의 로우(행)이 들어갈 지
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, cellforRowAt indexPath: IndexPath) -> UITableViewCell {
       
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}


