//
//  SignUpData.swift
//  login
//
//  Created by 정유경 on 2019/12/13.
//  Copyright © 2019 정유경. All rights reserved.
//

import Foundation

class SignUpData {
    static let shared = SignUpData()
    
    var data = [String: Any]()
    
    private init() {}
}
