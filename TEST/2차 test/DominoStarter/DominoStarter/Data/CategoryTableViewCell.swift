//
//  tablebTableViewCell.swift
//  DominoStarter
//
//  Created by 정유경 on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let categoryImageView = UIImageView()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
       
        
        categoryImageView.contentMode = .scaleAspectFit
        contentView.addSubview(categoryImageView)
        
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


