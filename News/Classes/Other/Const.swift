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

//自定义颜色(RGB方式)
func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

//自定义颜色(16进制方式)
func colorWithHexString(hexString:String)->UIColor{
    var cstr = hexString.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
    if(cstr.length < 6){
        return UIColor.clear;
    }
    if(cstr.hasPrefix("0X") || cstr.hasPrefix("0x")){
        cstr = cstr.substring(from: 2) as NSString
    }
    if(cstr.hasPrefix("#")){
        cstr = cstr.substring(from: 1) as NSString
    }
    if(cstr.length != 6){
        return UIColor.clear;
    }
    var range = NSRange.init()
    range.location = 0
    range.length = 2
    //r
    let rStr = cstr.substring(with: range);
    //g
    range.location = 2;
    let gStr = cstr.substring(with: range)
    //b
    range.location = 4;
    let bStr = cstr.substring(with: range)
    var r :UInt32 = 0x0;
    var g :UInt32 = 0x0;
    var b :UInt32 = 0x0;
    Scanner.init(string: rStr).scanHexInt32(&r);
    Scanner.init(string: gStr).scanHexInt32(&g);
    Scanner.init(string: bStr).scanHexInt32(&b);
    return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1);
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
//let BASE_URL = "http://wisdomnj.manjiwang.com"
let device_id: String = "6096495334"
let IID: String = "5034850950"

//站点序号
let wnj_siteId = "fef0791f7bd37b3de92954dd6d04ebb1"



