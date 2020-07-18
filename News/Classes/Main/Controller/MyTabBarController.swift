//
//  MyTabBarController.swift
//  News
//
//  Created by melo on 2020/7/10.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(tabBar.subviews)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //修改tabbar字体的颜色
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245 / 255.0, green: 90 / 255.0, blue: 93 / 255.0, alpha: 1.0)
        
        // 添加子控制器
        addChildViewController()
        
    }
    
    /// 添加子控制器
    func addChildViewController() {
        setChildViewController(HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectedImageName: "home_tabbar_press_32x32_")
        setChildViewController(VideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectedImageName: "video_tabbar_press_32x32_")
        setChildViewController(HuoshanViewController(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectedImageName: "huoshan_tabbar_press_32x32_")
        setChildViewController(MineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectedImageName: "mine_tabbar_press_32x32_")
        
        //利用KVC设置TabBar的中间的加号按钮
        // tabBar 是 readOnly属性，不能直接修改，利用KVC 把 readOnly属性的权限改过来
        setValue(MyTabBar(), forKey: "tabBar")
    }
    
    /// 初始化子控制
    func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectedImageName: String)  {
        //设置文字和图片
        childController.title = title;
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        // 添加导航控制器为 TabbarController的子控制器
        let nav = MyNavigationController(rootViewController: childController)
        addChild(nav)
    }
}
