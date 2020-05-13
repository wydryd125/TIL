//
//  CustomCell.swift
//  CollectionViewPractice
//
//  Created by 정유경 on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        contentView.addSubview(imageView)
        setupConstrains()
        
    }
    func setupConstrains() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}
