//
//  HomeViewListController.swift
//  News
//
//  Created by melo on 2020/7/16.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit
import JXSegmentedView


class HomeViewListVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: CGFloat(arc4random()%255) / 255, green: CGFloat(arc4random()%255) / 255, blue: CGFloat(arc4random()%255) / 255, alpha: 1.0)
        
    }
    
}

extension HomeViewListVC : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
