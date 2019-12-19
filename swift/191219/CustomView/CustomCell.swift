//
//  CustomCell.swift
//  CustomView
//
//  Created by 정유경 on 2019/12/19.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

//-> 6. 셀에서 해야할 일을 선언함. 버튼을 눌렀을때 해야할일 밖에 없어서 함수는 한개임.
protocol CustomCellDelegate: class {
    func didTapButton(cell: CustomCell)
}

class CustomCell: UITableViewCell {
    
    //-> 7. 델리게이트 선언부
    weak var delegate: CustomCellDelegate?
    
    private let mybutton = UIButton()
    
    //-> 5. 자동완성 하려면 init만 쳐보세요용~~~~
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        mybutton.setTitle("     +1     ", for: .normal)
        mybutton.layer.cornerRadius = 8
        mybutton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        mybutton.setTitleColor(.black, for: .normal)
        mybutton.backgroundColor = .yellow
        mybutton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        contentView.addSubview(mybutton)
    
        baseUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func baseUI() {
        mybutton.translatesAutoresizingMaskIntoConstraints = false
        mybutton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        mybutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        mybutton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    //- 여기까지 5!!!
    
    @objc func didTapButton() {
        
        //-> 8.델리게이트가 작동되는 시점
        delegate?.didTapButton(cell: self)
    }
}
