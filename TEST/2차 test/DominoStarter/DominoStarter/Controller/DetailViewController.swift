//
//  DetailViewController.swift
//  DominoStarter
//
//  Created by Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var shared = Singleton.shared
    
    var imageName = ""
    var count: Int = 0 {
        willSet {
        }
        didSet {
            label.text = "\(count) 개"
        }
    }

    let detailImage = UIImageView()
    let tempView = UIView()
    let label = UILabel()
    let plusButton = UIButton()
    let minusButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
         baseUI()
        autoLayout()
        
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
    }
    
    func baseUI() {
        title = imageName
        detailImage.image = UIImage(named: imageName)
        detailImage.contentMode = .scaleAspectFit
        view.addSubview(detailImage)
        
        label.backgroundColor = .darkGray
        label.text = String(count) + "개"
        label.tintColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.backgroundColor = .white
        plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        view.addSubview(plusButton)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.backgroundColor = .white
        minusButton.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        view.addSubview(minusButton)
        
    }
    func autoLayout() {
        let safe = view.safeAreaLayoutGuide
        
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo:safe.topAnchor, constant: 30).isActive = true
        detailImage.centerXAnchor.constraint(equalTo: safe.centerXAnchor).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: label.topAnchor, constant: 5).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -5).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: label.topAnchor, constant: 5).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 5).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
    }
    @objc func didTapPlusButton(_ sender: UIButton) {
       count += 1
        
        if count != 0 {
            shared.wishListDict[imageName] = count
          }
    }
    @objc func didTapMinusButton(_ sender: UIButton) {
        count -= 1
        
    }
    
    
}


