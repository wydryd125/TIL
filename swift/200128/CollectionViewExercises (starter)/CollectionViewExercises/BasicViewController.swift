//
//  BasicViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class BasicViewController: UIViewController {
  
  let dataSource = cards
  var collectionView: UICollectionView!
//     let layout = UICollectionViewFlowLayout()
//    lazy var collectionView = UICollectionView(
//        frame: view.frame, UICollectionViewLayout: layout
//    )

    override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
    func setupCollectionView() {
        let inset = CGFloat(9)
        let margin = CGFloat(20)

        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: inset , left: inset, bottom: inset, right: inset)
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        layout.itemSize = CGSize(width: (view.frame.width - (inset * 2 + margin * 3)) / 4, height: 200)

        collectionView = UICollectionView(frame: view.frame.offsetBy(dx: 0, dy: 0), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Color")
        
        view.addSubview(collectionView)
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension BasicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Color", for: indexPath)
    cell.contentView.backgroundColor = dataSource[indexPath.item].color
    
    return cell
  }
}
