//
//  HttpRequestExtension.swift
//  News
//
//  Created by melo on 2020/7/21.
//  Copyright © 2020 陈诚. All rights reserved.
//  枚举HttpRequest的扩展，遵循Moya的TargetType，各个网络请求的配置写在这里面(注意：Moya协议的各个方法必须实现)

import Foundation
import Moya //Moya是一个高度面向协议编程的库，下面的6个协议是必须实现的

extension HttpRequest : TargetType {
    //1.服务器地址
    var baseURL: URL {
        return URL(string: "http://wisdomnj.manjiwang.com")!
    }
    
    //2.各个请求的具体路径
    var path: String {
        switch self {
        case .getHomePageChannelAPI:
            return "api/v1/channel/getChannel"
        case .getHomePageNewsListAPI:
            return "/api/v1/news/getNews"
//        default: //swift的switch中的default可以不用写~
//            return ""
        }
    }
    
    //3.请求方式
    var method: Moya.Method  {
        switch self {
        case .getHomePageChannelAPI:
            return .get
        case .getHomePageNewsListAPI:
            return .get
//        default:
//            return .get
        }
    }
    
   //4.请求任务事件
    var task: Task {
        
        //初始化一个空的可变字典
        var params : [String : Any] = [:]
        
        switch self {
        case .getHomePageChannelAPI:
            params = ["siteId":wnj_siteId,"userId":"","type":"1","size":2,"regionCode":500105]
        case .getHomePageNewsListAPI:
            params = ["siteId":wnj_siteId,"channelId":"7978eb1aa8142f830b1867a9eb94cc50","regionCode":0,"userId":"","pageIndex":1,"pageSize":20]
//        default:
//            return .requestPlain //不需要传参走这里
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    //5.设置请求头
    var headers: [String : String]? {
        return nil
    }
    
    //6.这个就是做单元测试模拟的数据，只会在单元测试文件中有作用，但是是TargetType协议必须实现滴，得写在这里~
    var sampleData: Data  {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
}
