//
//  WeatherProvider.swift
//  WeatherForecast
//
//  Created by 정유경 on 2020/02/25.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

class WeatherProvider {
    
    func fetchCurrent(completion: @escaping (CurrentModel) -> ()) {
        let str = "https://apis.openapi.sk.com/weather/current/hourly?city=서울&county=성북구&village=돈암2동&appKey=l7xxd05ace81cc9f4dbc8cd0ce5c70fb34af"
        
        let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let convertedURL = URL(string: queryEncodedStr)!
        
        
        let dataTask = URLSession.shared.dataTask(with: convertedURL) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let weather = jsonObject["weather"] as? [String: Any],
                let hourly = weather["hourly"] as? [[String: Any]],
                let grid = hourly[0]["grid"] as? [String: String],
                //                let longitude = grid["longitude"] as? String,
                //                let latitude = grid["latitude"] as? String,
                let city = grid["city"],
                let county = grid["county"],
                let village = grid["village"],
                let sky = hourly[0]["sky"] as? [String: String],
                let code = sky["code"],
                let name = sky["name"],
                let temperature = hourly[0]["temperature"] as? [String: String],
                let tc = temperature["tc"],
                let tmax = temperature["tmax"],
                let tmin = temperature["tmin"]
                
                else { return print("안들어왔어") }
            
            let current = CurrentModel(city: city, county: county, village: village, code: code, name: name, tc: tc, tmax: tmax, tmin: tmin)
            
            completion(current)
        }
        
        dataTask.resume()
        
    }
    
    
    
    func fetchThreeHour(completion: @escaping (ThreeHourCurrentModel) -> ()) {
        let str = "https://apis.openapi.sk.com/weather/forecast/3days?appkey=l7xxd05ace81cc9f4dbc8cd0ce5c70fb34af&city=서울&county=성북구&village=돈암2동"
        
        let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let convertedURL = URL(string: queryEncodedStr)!
        
        let dataTask = URLSession.shared.dataTask(with: convertedURL) { (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                let weather = jsonObject["weather"] as? [String: Any],
                let forecast3days = weather["forecast3days"] as? [[String: Any]],
                let fcst3hour = forecast3days[0]["fcst3hour"] as? [String: Any],
                let timeRelease = forecast3days[0]["timeRelease"] as? String,
                let sky =  fcst3hour["sky"] as? [String: String],
                let temperature = fcst3hour["temperature"] as? [String: String]
                
                else { return print("세시간 안들어옴") }
            
            let threeCurrent = ThreeHourCurrentModel(timeRelease: timeRelease, sky: sky, temperature: temperature)
            
            completion(threeCurrent)

//
//            var skyStrArray = [String]()
//            let skyKeys = sky.keys.sorted()
//            print(skyKeys)
//
//            for key in skyKeys {
//                guard let value = sky[key], !value.isEmpty else { continue }
//                print("---for문 입성")
//                print("key",key)
//                if key.contains("code") {
//                    skyStrArray.append(value)
//                } else {
//                    continue
//                }
//            }
//            print(skyStrArray)
        }
        dataTask.resume()
    }
}
