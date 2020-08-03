//
//  HomePageFunctionPopView.swift
//  News
//
//  Created by melo on 2020/8/3.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

class HomePageFunctionPopView: UIView {

//    var bgView: UIView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        
    }
    
    func hide() {
        
    }
}
