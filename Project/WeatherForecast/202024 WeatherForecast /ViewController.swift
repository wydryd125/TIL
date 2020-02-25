//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Giftbot on 2020/02/22.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let tableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
      setUI()
        
        WeatherProvider().fetchCurrent() { data in
            print(data)
        }
        WeatherProvider().fetchThreeHour() { data in
            print(data)
            
        }
    }
    func setUI() {
        
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.idenifier)
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.rowHeight = 80
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.idenifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        
        cell.configure(imageName: "SKY_01", temp: "29도", hour: "4시", date: "2020-10-20")
        
        return cell
    }
    
}

