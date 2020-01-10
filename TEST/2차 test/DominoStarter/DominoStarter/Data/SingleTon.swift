//
//  Singleton.swift
//  DominoStarter
//
//  Created by 정유경 on 2020/01/08.
//  Copyright © 2020 Kira. All rights reserved.
//

import Foundation

final class Singleton {
    static let shared = Singleton()
//    private init(){}
    
    var wishListDict: [String: Int] = [:]
}
