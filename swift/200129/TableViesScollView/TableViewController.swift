//
//  TableViewController.swift
//  TableViesScollView
//
//  Created by 정유경 on 2020/01/29.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setNavigation()
     
    }
    func setNavigation() {
        navigationItem.title = "TableView"
    }
    func setUI() {
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return menuData.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuData[section].category
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return menuData[section].products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuData[indexPath.section].products[indexPath.row].name
       
        return cell
    }
    
    
}



   
