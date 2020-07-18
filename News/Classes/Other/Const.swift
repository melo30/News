//
//  Const.swift
//  News
//
//  Created by melo on 2020/7/10.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

/// 屏幕的宽度
let screenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
let screenHeight = UIScreen.main.bounds.height

//自定义颜色
func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

//KeyWindow
let keyWindow = UIApplication.shared.windows

//判断是否为iphone
let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

//判断是否为iphoneX
let kIsIphoneX = Bool(screenWidth >= 375.0 && screenHeight > 812.0 && kIsIphone)

//导航栏高度
let kNavgationBarH = CGFloat(kIsIphoneX ? 88 : 64)

//状态栏高度
let kStatusBarH = CGFloat(kIsIphoneX ? 44 : 20)

//tabbar高度
let kTabBarH = CGFloat(kIsIphoneX ? (49 + 34) : 49)

//字号

func customFont(font :CGFloat) -> UIFont {
    //刘海屏
    guard screenHeight <= 736 else {
        return UIFont.systemFont(ofSize: font)
    }
    //5,5
    guard screenHeight <= 736 else {
        return UIFont.systemFont(ofSize: font - 2)
    }
    //4,7
    guard screenHeight <= 736 else {
        return UIFont.systemFont(ofSize: font - 4)
    }
    
    return UIFont.systemFont(ofSize: font)
}




//服务器地址
//let BASE_URL = "https://lf.snssdk.com"
//let BASE_URL = "https://ib.snssdk.com"
let BASE_URL = "https://is.snssdk.com"
let device_id: String = "6096495334"
let IID: String = "5034850950"




