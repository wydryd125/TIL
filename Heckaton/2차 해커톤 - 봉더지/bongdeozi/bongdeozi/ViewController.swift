//
//  ViewController.swift
//  bongdeozi
//
//  Created by 정유경 on 2020/02/01.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pad = 3
    let cellButton = CustomCell()
    let backgroundImage = UIImageView()
    let collectionView: UICollectionView = {
        UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
    }
    
    func setUI() {
        backgroundImage.image = UIImage(named: "배경")
//        backgroundImage.alpha =
        backgroundImage.contentMode = .scaleToFill
        view.addSubview(backgroundImage)
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        view.addSubview(collectionView)
    }
    
    func setConstraint(){
        let guide = view.safeAreaLayoutGuide
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: 80).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.6).isActive = true
        
        
    }

    struct Padding {
        static let line: CGFloat = 0
        static let item: CGFloat = 0
        static let inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pad * pad
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        cell.delegate = self
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Padding.inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Padding.line
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Padding.item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (collectionView.frame.width - ( Padding.item * CGFloat(pad - 1) ) - (Padding.inset.left + Padding.inset.right)) / CGFloat(pad)
        let itemHeight = (collectionView.frame.height - (Padding.item * CGFloat(pad - 1) ) - (Padding.inset.top + Padding.inset.bottom)) / CGFloat(pad)
        
        
//        let itemWidth = (collectionView.frame.width - CGFloat(8 * 4)) / 3
//        let itemHeight = (collectionView.frame.height - CGFloat(8 * 4)) / 3
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
extension ViewController: CellButtonDelegate {
    func didTapButtonAction(_ sender: UIButton) {
        let fireVC = FirebongViewController()
        fireVC.modalPresentationStyle = .overCurrentContext
        
        present(fireVC, animated: false)
    }
    
    
}

