//
//  CustomCell.swift
//  bongdeozi
//
//  Created by 정유경 on 2020/02/01.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

protocol CellButtonDelegate: class {
    func didTapButtonAction(_ sender: UIButton)
}

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    private let imageView = UIImageView()
    private let cellButton = UIButton()
    
    weak var delegate: CellButtonDelegate?
    

    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setupConstraints()
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "두더지")
        contentView.addSubview(imageView)
        
        cellButton.backgroundColor = .clear
        cellButton.addTarget(self, action: #selector(didTapCellButon), for: .touchUpInside)
        contentView.addSubview(cellButton)
    }
    
    private func setupConstraints() {
        [imageView, cellButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           
            cellButton.topAnchor.constraint(equalTo: imageView.topAnchor),
            cellButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            cellButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            cellButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
    func configure(image: UIImage?) {
        imageView.image = image
    }
    @objc func didTapCellButon(_ sender: UIButton) {
        delegate?.didTapButtonAction(sender)
        if imageView.image == UIImage(named: "두더지") {
            imageView.image = UIImage(named: "두더지없음")
        } else {
            imageView.image = UIImage(named: "두더지")
        }
        
    }
}

