//
//  WeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by 정유경 on 2020/02/25.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class WeatherTableViewCell: UITableViewCell {
    
    static let idenifier = "CustomCell"
    
    private let weatherImage = UIImageView()
    private let tempLabel = UILabel()
    private let hourLabel = UILabel()
    private let dateLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        setUI()
        setAutoLayout()
        contentView.backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageName: String, temp: String, hour: String, date: String) {
        weatherImage.image = UIImage(named: imageName)
        tempLabel.text = temp
        hourLabel.text = hour
        dateLabel.text = date
    }
    
    private func setUI() {
        
        weatherImage.image = UIImage(named: "SKY_00")
        weatherImage.contentMode = .scaleAspectFit
        contentView.addSubview(weatherImage)
        tempLabel.text = "온도"
        tempLabel.textAlignment = .center
        contentView.addSubview(tempLabel)
        hourLabel.text = "시간"
        hourLabel.textAlignment = .center
        contentView.addSubview(hourLabel)
        dateLabel.text = "날짜"
        dateLabel.textAlignment = .center
        contentView.addSubview(dateLabel)

    }
    
    private func setAutoLayout() {
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4).isActive = true
        
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
        hourLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        hourLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor).isActive = true
        hourLabel.widthAnchor.constraint(equalTo: dateLabel.widthAnchor).isActive = true
        hourLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 16).isActive = true
        weatherImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        weatherImage.widthAnchor.constraint(equalTo: weatherImage.heightAnchor).isActive = true
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        tempLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        tempLabel.widthAnchor.constraint(equalTo: tempLabel.heightAnchor).isActive = true
               
        
       
        
    }
    
}



