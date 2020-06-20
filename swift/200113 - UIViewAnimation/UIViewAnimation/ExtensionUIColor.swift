//
//  ExtensionUIColor.swift
//  UIViewAnimation
//
//  Created by 정유경 on 2020/01/13.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

extension UIColor {
  class var random: UIColor {
    get {
      let min: CGFloat = 0.3
      let max: CGFloat = 0.7
      let red = CGFloat.random(in: min ... max)
      let green = CGFloat.random(in: min ... max)
      let blue = CGFloat.random(in: min ... max)
      return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
  }
}
