//
//  ListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    let listTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        listTableView.dataSource = self
        listTableView.delegate = self
       
        baseUI()
        autoLayout()

    }

    func baseUI() {
        view.addSubview(listTableView)
    }
    
    func autoLayout() {
        let safe = view.safeAreaLayoutGuide
        
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        listTableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor).isActive = true
    }
    
    
}
extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuData.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData[section].products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
       
        let product = menuData[indexPath.section].products[indexPath.row]
        cell.imageView?.image = UIImage(named: product.name)
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = String(product.price)
        cell.selectionStyle = .none
        
        return cell
        
    }
}
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        let name = menuData[indexPath.section].products[indexPath.row].name
        detailVC.title = name
        detailVC.detailImage.image = UIImage(named: name)
        detailVC.imageName = name
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIImageView()
        headerView.backgroundColor = .white
        headerView.image = UIImage(named: menuData[section].category)
        headerView.contentMode = .scaleAspectFit
       
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
   

    
}
