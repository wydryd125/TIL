//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cats: [String] = []
    let count = 100
    var collectionView: UICollectionView!

    
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    
    for i in 0...19 {
        let named = "cat" + String(i % 10)
        cats.append(named)
    }
    
  }
    func setupCollectionView() {
        let margin: CGFloat = 10
        let itemSize = (view.frame.width - margin * 3) / 2
        let layout = UICollectionViewFlowLayout()
       
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        layout.itemSize = CGSize(width: itemSize, height: itemSize )
        
        collectionView = UICollectionView(frame: view.frame.offsetBy(dx: 0, dy: 0), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "Cat")
        
        view.addSubview(collectionView)
    }
  
  // MARK: Action

}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cat", for: indexPath) as! CustomCell
//        cell.backgroundColor = .red
        let image = UIImage(named: cats[indexPath.item])
        cell.imageView.image = image
        cell.layer.cornerRadius = 10
        
        return cell

    }
 
}
