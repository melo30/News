//
//  PersonalInfoViewController.swift
//  News
//
//  Created by melo on 2020/7/16.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit
import JXSegmentedView
import JXPagingView

class PersonalInfoViewController: UIViewController {

    var pagingView : JXPagingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.title = "个人主页"
        self.navigationController?.navigationBar.isTranslucent = false
        
        
    }

}
