//
//  SupplementaryViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.



// 셀 크기 = (80, 80) / 아이템과 라인 간격 = 4 / 인셋 = (25, 5, 25, 5)
// 헤더 높이 50, 푸터 높이 3

import UIKit

final class SupplementaryViewController: UIViewController {
    
    var dataSource: [Section] = sections
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: 60, height: 60)
        layout.footerReferenceSize = CGSize(width: 4, height: 4)
        
        layout.sectionFootersPinToVisibleBounds = true
        layout.sectionHeadersPinToVisibleBounds = true
    
        return layout
    }()
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
        cv.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
        cv.backgroundColor = .white
        cv.dataSource = self
        view.addSubview(cv)
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFlowLayout()
        
    }
    func setUpFlowLayout() {
        let itemInLine: CGFloat = 4
        let spacing: CGFloat = 10
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let cvWidth = collectionView.bounds.width
        let contentSize = (cvWidth - inset.left - inset.right - (spacing * (itemInLine - 1)))
        let itemSize = ( contentSize / itemInLine ).rounded(.down)
    
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = inset
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
   
        
    }
}


// MARK: - UICollectionViewDataSource

extension SupplementaryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = dataSource[indexPath.section].cards[indexPath.item].color
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.identifier,
                for: indexPath) as! SectionHeaderView
            print(indexPath)
            header.configure(title: "\(indexPath.section + 1)" + "번!!!!!")
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "Footer",
                for: indexPath)
            footer.backgroundColor = .gray

            return footer
        }
    }
}
