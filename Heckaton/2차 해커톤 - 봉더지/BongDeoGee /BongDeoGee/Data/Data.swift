//
//  Data.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/02.
//  Copyright © 2020 Jisng. All rights reserved.
//

import Foundation
import UIKit

struct Padding {
  static let padding: CGFloat = 50
  static let buttonPadding: CGFloat = 20
}

enum selectStatus {
  case fail, success, bbongs
}

struct InfoModel {
  let name: String
  var level: Int
  var scroe: Int
}
