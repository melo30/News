//
//  MyTabBar.swift
//  News
//
//  Created by melo on 2020/7/10.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishButton)
    }
    
    // private绝对私有，除了在当前类中可以访问之外，其他任何类或者改类的扩展都不能访问到
    // fileprivate 文件私有，可以在当前类文件中访问，其他文件不能访问
    // open 公开，在任何类文件中都能访问
    // internal 默认，也可以不写
    private lazy var publishButton: UIButton = {
        let publishButton = UIButton(type: .custom)
        publishButton.setBackgroundImage(UIImage(named: "feed_publish_44x44_"), for: .normal)
        publishButton.setBackgroundImage(UIImage(named: "feed_publish_press_44x44_"), for: .selected)
        publishButton.addTarget(self, action: #selector(publishButtonAction), for: .touchUpInside)
        publishButton.sizeToFit()
        return publishButton
    }()
    
    @objc func publishButtonAction() {
        let popV = HomePageFunctionPopView()
        popV.show()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 当前tabbar的宽度和高度
        let width = frame.width
        let height = frame.height
        
        //设置加号按钮的位置
        publishButton.center = CGPoint(x: width * 0.5, y: height * 0.5 - 20)
        
        //设置除了加号的其他按钮的frame
        let buttonW: CGFloat = width * 0.2 //5个按钮，就是5分之一处
        let buttonH: CGFloat = height
        let buttonY: CGFloat = 0
        
        var index = 0
        
        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!) {
                continue
            }
            let buttonX = buttonW * (index > 1 ? CGFloat(index + 1) : CGFloat(index))
            
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            
            index += 1
        }
        
    }
}
