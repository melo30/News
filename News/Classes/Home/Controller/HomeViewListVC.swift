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
import Kingfisher
import MJRefresh

class HomeViewListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //父容器传值过来的属性
    var channelId : String?
    //顶部刷新
    let header = MJRefreshNormalHeader()
    //底部刷新
    let footer = MJRefreshAutoNormalFooter()
    //页码（初始值为1）
    var pageIndex : Int = 1
    
    //初始化一个全局变量模型空数组
    var datas = [HomePageListDataList]()
    //这里直接利用lazy懒加载语法初始化出来一个tableView
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeSingleTextCell.self, forCellReuseIdentifier: NSStringFromClass(HomeSingleTextCell.self))
        tableView.register(HomePageSinglePicCell.self, forCellReuseIdentifier: NSStringFromClass(HomePageSinglePicCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        //顶部刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        header.setTitle("松开即可刷新哟...", for: .pulling)
        header.setTitle("刷新中...", for: .refreshing)
        tableView.mj_header = header
        //底部刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        tableView.mj_footer = footer
        
        //开始刷新
        tableView.mj_header?.beginRefreshing()
        
    }
    
    @objc func headerRefresh() {
        pageIndex = 1
        //实例化一个遵循HttpRequest的MoyaProvider
        let provider = MoyaProvider<HttpRequest>()
        provider.request(.getHomePageNewsListAPI(siteId: wnj_siteId, channelId: channelId!, regionCode: 0, userId: "", pageIndex: pageIndex, pageSize: 20)) { (Result) in
                switch Result {
                    case let .success(response):
                        self.tableView.mj_header?.endRefreshing()
                        //第一步.Data转成String
                        let jsonString = String(data: response.data, encoding: .utf8)
                        
                        //json字符串转字典可以清晰看到返回结果层级
                        let dict = getDictionaryFromJSONString(jsonString: jsonString!)
                        print(dict)
                        
                        //第二步.HandyJSON转成Model
                        let model = JSONDeserializer<HomePageListModel>.deserializeFrom(json: jsonString)
                        //第三步.先清空数组，再把模型数组放入self.datas中去，注意：闭包内部使用全局变量datas要加self哟~
                        self.datas.removeAll()
                        self.datas = model?.Data?.list ?? []
                    
                        //第四步.刷新tableView,展示数据
                        self.tableView.reloadData()
                    
                    case let .failure(error):
                        self.tableView.mj_header?.endRefreshing()
                        print(error)
            }
        }
    }
    
    @objc func footerRefresh() {
        pageIndex += 1
        //实例化一个遵循HttpRequest的MoyaProvider
        let provider = MoyaProvider<HttpRequest>()
        provider.request(.getHomePageNewsListAPI(siteId: wnj_siteId, channelId: channelId!, regionCode: 0, userId: "", pageIndex: pageIndex, pageSize: 20)) { (Result) in
                switch Result {
                    case let .success(response):
                        self.tableView.mj_footer?.endRefreshing()
                        //第一步.Data转成String
                        let jsonString = String(data: response.data, encoding: .utf8)
                        
                        //json字符串转字典可以清晰看到返回结果层级
                        let dict = getDictionaryFromJSONString(jsonString: jsonString!)
                        print(dict)
                        
                        //第二步.HandyJSON转成Model
                        let model = JSONDeserializer<HomePageListModel>.deserializeFrom(json: jsonString)
        
                        //第三步.把模型数组加入self.datas中去，注意：闭包内部使用全局变量datas要加self哟~
                        if (model?.Data?.list!.count)! > 0 {
                            self.datas.append(contentsOf: (model?.Data!.list)!)
                        }else {
                            self.tableView.mj_footer?.endRefreshingWithNoMoreData()
                        }
                        
                        //第四步.刷新tableView,展示数据
                        self.tableView.reloadData()
                    
                    case let .failure(error):
                        self.tableView.mj_footer?.endRefreshing()
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
        if model.newsType == "news" {
            if model.newsCoverList!.count > 0 {
                let cell : HomePageSinglePicCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomePageSinglePicCell.self), for: indexPath) as! HomePageSinglePicCell
                cell.titleLab?.text = model.newsTitle
                cell.imgV?.kf.setImage(with: URL(string: (model.newsCoverList?[0])!))
                cell.authorLab?.text = model.userName
                cell.commentLab?.text = "\(String(model.commentCount!,radix: 10)) 评论"
                cell.timeLab?.text = model.newsPublishTime
                return cell
            }else {
                let cell : HomeSingleTextCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeSingleTextCell.self), for: indexPath) as! HomeSingleTextCell
                cell.titleLab?.text = model.newsTitle
                cell.authorLab?.text = model.userName
                cell.commentLab?.text = "\(String(model.commentCount!,radix: 10)) 评论"
                cell.timeLab?.text = model.newsPublishTime
                return cell
            }
        }
        
        //视频、广告等其他类型cell，后面再添加
        let cell : HomeSingleTextCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeSingleTextCell.self), for: indexPath) as! HomeSingleTextCell
        cell.titleLab?.text = model.newsTitle
        cell.authorLab?.text = model.userName
        cell.commentLab?.text = "\(String(model.commentCount!,radix: 10)) 评论"
        cell.timeLab?.text = model.newsPublishTime
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
