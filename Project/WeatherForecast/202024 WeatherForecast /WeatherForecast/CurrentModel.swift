//
//  CurrentModel.swift
//  WeatherForecast
//
//  Created by 정유경 on 2020/02/25.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct CurrentModel {
    let city: String
    let county: String
    let village: String
    let code: String
    let name: String
    let tc: String
    let tmax: String
    let tmin: String
}
struct ThreeHourCurrentModel {
    let timeRelease: String
    let sky: [String: String]
    let temperature: [String: String]
    
}
