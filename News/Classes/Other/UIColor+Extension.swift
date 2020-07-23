//
//  UIColor+Extension.swift
//  News
//
//  Created by melo on 2020/7/10.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

extension UIColor {
    ///主题红色（类方法）- 外部可直接通过 UIColor.kthemRedColor() 来调用
    class func kThemRedColor() -> UIColor {
        return colorWithHexString(hexString: "#C5403A")
    }
    
    /// 背景灰色
    class func globalBackgroundColor() -> UIColor {
        return RGBColor(r: 248, g: 249, b: 247)
    }
}
