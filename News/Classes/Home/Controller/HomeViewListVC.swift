//
//  HomeViewListController.swift
//  News
//
//  Created by melo on 2020/7/16.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit
import JXSegmentedView
import Moya
import SwiftyJSON
import HandyJSON

class HomeViewListVC: UIViewController {
    
    //全局变量模型数组
    var datas = [HomePageListDataList]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: CGFloat(arc4random()%255) / 255, green: CGFloat(arc4random()%255) / 255, blue: CGFloat(arc4random()%255) / 255, alpha: 1.0)
        requestData()
    }
    
    func requestData() {
        //实例化一个遵循HttpRequest的MoyaProvider
        let provider = MoyaProvider<HttpRequest>()
        provider.request(.getHomePageNewsListAPI) { (Result) in
            switch Result {
                case let .success(response):
                    //第一步.Data转成String
                    let jsonString = String(data: response.data, encoding: .utf8)
                    //第二步.HandyJSON转成Model
                    let model = JSONDeserializer<HomePageListModel>.deserializeFrom(json: jsonString)
                    
                    //这里可以用for-in 或者forEach遍历查看一下数组内部的值，看HandyJson是否转成功啦~
//                    model?.Data?.list?.forEach({ (listModel) in
//                        print(listModel.newsTitle)
//                    })
                    for listModel in (model?.Data!.list)! {
                        print(listModel.newsTitle as Any)
                    }
                
                    //第三步.把模型数组放入self.datas中去，注意：闭包内部使用全局变量datas要加self哟~
                    self.datas = model?.Data?.list ?? []
                
                    //第四步.刷新tableView,展示数据
                    
                case let .failure(error):
                        print(error)
            }
            
        }
    }
}

extension HomeViewListVC : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
