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

class HomeViewListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //初始化一个全局变量模型空数组
    var datas = [HomePageListDataList]()
    //这里直接利用lazy懒加载语法初始化出来一个tableView
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeSingleTextCell.self, forCellReuseIdentifier: NSStringFromClass(HomeSingleTextCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: CGFloat(arc4random()%255) / 255, green: CGFloat(arc4random()%255) / 255, blue: CGFloat(arc4random()%255) / 255, alpha: 1.0)
        requestData()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
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
                    self.tableView.reloadData()
                case let .failure(error):
                        print(error)
            }
            
        }
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model : HomePageListDataList = datas[indexPath.row];
        let cell : HomeSingleTextCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeSingleTextCell.self), for: indexPath) as! HomeSingleTextCell
        cell.titleLab?.text = model.newsTitle
        return cell
    }
    
    //这里高度不用设置，SnapKit和Masonry同理只要Cell内部控件把Cell撑起来了，就能自动自适应高度~
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
}

extension HomeViewListVC : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
