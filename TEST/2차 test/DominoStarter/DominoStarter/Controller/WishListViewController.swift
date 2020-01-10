//
//  WishListViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    let wishTableView = UITableView()
    var shared = Singleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wishTableView.dataSource = self
        wishTableView.rowHeight = 100
        wishTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CallID")
        
        baseUI()
        autoLayout()
        navigationSet()
    }

  
    func navigationSet(){
        let resetButton = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(didTapResetButton))
        navigationItem.leftBarButtonItem = resetButton
        
        let orderButton = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(didTapOrderButton))
        navigationItem.rightBarButtonItem = orderButton
        
    }
    
    func baseUI() {
        view.addSubview(wishTableView)
        
    }
    func autoLayout() {
        let safe = view.safeAreaLayoutGuide
        
        wishTableView.translatesAutoresizingMaskIntoConstraints = false
        wishTableView.topAnchor.constraint(equalTo: safe.topAnchor).isActive = true
        wishTableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor).isActive = true
        wishTableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor).isActive = true
        wishTableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor).isActive = true
        
        
        
    }
    @objc func didTapResetButton() {
        shared.wishListDict.removeAll()
        wishTableView.reloadData()
    }
    @objc func didTapOrderButton() {
        alertAction(title: "결제하기", message: "결제금액은용?")
    
    }
    func alertAction(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "결제하기", style: .default) { _ in
            self.shared.wishListDict.removeAll()
            self.wishTableView.reloadData()
        }
        
        let cancelAlert = UIAlertAction(title: "취 소", style: .cancel)
        alertController.addAction(okAlert)
        alertController.addAction(cancelAlert)
        present(alertController, animated: true)
        
        
    }
}
extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shared.wishListDict.keys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = shared.wishListDict.keys.sorted()
        var cell = UITableViewCell()
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell"){
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
       
        
        cell.textLabel?.text = keys[indexPath.row]
        cell.imageView?.image = UIImage(named: keys[indexPath.row])
        cell.detailTextLabel?.text = "주문수량: \(shared.wishListDict[keys[indexPath.row]]!)"
        cell.selectionStyle = .none
        
        return cell
    }
}



