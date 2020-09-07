//
//  ApplicationViewController.swift
//  News
//
//  Created by melo on 2020/7/10.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

class ApplicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //导航栏背景颜色
        navigationController?.navigationBar.barTintColor = UIColor.kThemRedColor()
        //导航栏字体颜色
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //设置导航栏为不透明，这样就可以让frame自动从导航栏下面开始布局
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
}
