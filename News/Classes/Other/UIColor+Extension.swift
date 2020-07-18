//
//  UIColor+Extension.swift
//  News
//
//  Created by melo on 2020/7/10.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

extension UIColor {
    /// 背景灰色（类方法）- 外部可直接通过 UIColor.globalBackgroundColor() 来调用
    class func globalBackgroundColor() -> UIColor {
        return RGBColor(r: 248, g: 249, b: 247)
    }
}
