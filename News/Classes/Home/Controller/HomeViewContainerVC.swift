//
//  HomeViewController.swift
//  News
//
//  Created by melo on 2020/7/10.
//  Copyright © 2020 陈诚. All rights reserved.
//

import UIKit
import JXSegmentedView
import Alamofire
//Moya封装自Alamofire,有点类似OC的YTKNetwork，不过YTKNetwork是纯面向对象编程，Moya是面向协议编程
import Moya
import SwiftyJSON


class HomeViewContainerVC: UIViewController {
    var segmentedDataSource: JXSegmentedTitleDataSource?
    let segmentedView = JXSegmentedView()
    //懒加载
    lazy var listContainerView : JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segmentedView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        listContainerView.frame = CGRect(x: 0, y: 50, width: view.bounds.size.width, height: view.bounds.size.height - 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        //设置导航栏为不透明，这样就可以让frame自动从导航栏下面开始布局
        navigationController?.navigationBar.isTranslucent = false
        //或者 酱紫
//        self.edgesForExtendedLayout = .init(rawValue: 0)
        
        //1.初始化segmentView
        segmentedView.delegate = self
        view.addSubview(segmentedView)
        
        //2.设置JXSegmentedListContainerView(JXSegmentedListContainerView已采用懒加载方式初始化)
        segmentedView.listContainer = listContainerView
        view.addSubview(listContainerView)
        
        //3.初始化dataSource
        //3.1配置数据源相关配置属性
        //segmentedDataSource一定要通过属性强持有，不然会被释放掉
        segmentedDataSource = JXSegmentedTitleDataSource()
//        segmentedDataSource?.titles = ["关注","推荐","体育","视频","小视频","娱乐","健康","美食","军事","疫情"]
        //3.2设置title的颜色渐变过渡
        segmentedDataSource?.isTitleColorGradientEnabled = true
        //3.3关联dataSource
        segmentedView.dataSource = segmentedDataSource
        
        
        //4.初始化指示器indicator
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        segmentedView.indicators = [indicator]
        
        requestData()
    }
    
    func requestData() {
        //1.用Moya发起请求
            //实例化一个遵循HttpRequest的MoyaProvider
            let provider = MoyaProvider<HttpRequest>()

            provider.request(.getHomePageChannelAPI) { (Result) in
                switch Result {
                case let .success(response):
                    let dict:[String:Any] = try! JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as! [String:Any]
                    
                    let list = dict["Data"] as! Array<AnyObject>
                    
                    let channelModel = [HomePageChannelModel].deserialize(from: list)
                    var titles : [String] = []
                    channelModel?.forEach({ (model) in
                        titles.append((model?.channelName)!)
                    })
                    
                    self.segmentedDataSource?.titles = titles
                    self.segmentedView.reloadData()
                    
                    
                case let .failure(error):
                        print(error)
                }
            }
        
        
        //2.用Alamofire发起请求
//        AF.request("http://wisdomnj.manjiwang.com/api/v1/channel/getChannel", method: .get, parameters: ["siteId":wnj_siteId,"userId":"","type":"1","size":2,"regionCode":500105]).responseJSON { (response) in
//            switch response.result {
//            case .success(let json):
//                print("json:\(json)")
//                let dict = json as! Dictionary<String,Any>
//                let list = dict["Data"] as! Array<AnyObject>
//
//                let channelModel = [HomePageChannelModel].deserialize(from: list)
//
//                print("model:\(String(describing: channelModel))")
//
//                var titles : [String] = []
//                channelModel?.forEach({ (model) in
//                    titles.append((model?.channelName)!)
//                })
//
//                self.segmentedDataSource?.titles = titles
//                self.segmentedView.reloadData()
//
//            case .failure(let error):
//                print("error:\(error)")
//            }
//
//        }
        
    }
}


extension HomeViewContainerVC : JXSegmentedViewDelegate {
    // MARK: - 可选实现JXSegmentedViewDelegate代理
    
    /// 点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，而不关心具体是点击还是滚动选中的情况。
    /// - Parameters:
    ///   - segmentedView: ..
    ///   - index: ..
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        
    }
    
    
    /// 点击选中的情况才会调用该方法
    /// - Parameters:
    ///   - segmentedView: ..
    ///   - index: ..
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        
    }
    
    
    /// 滚动选中的情况才会调用该方法
    /// - Parameters:
    ///   - segmentedView: ..
    ///   - index: ..
    func segmentedView(_ segmentedView: JXSegmentedView, didScrollSelectedItemAt index: Int) {
        
    }

}


extension HomeViewContainerVC : JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return segmentedDataSource?.titles.count ?? 0
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        return HomeViewListVC()
    }
}
