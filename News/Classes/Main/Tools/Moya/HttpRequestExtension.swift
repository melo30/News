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
            return "/api/v1/channel/getChannel"
        case .getHomePageNewsListAPI:
            return "/api/v1/news/getNews"
        }
    }
    
    //3.请求方式
    var method: Moya.Method  {
        switch self {
        case .getHomePageChannelAPI:
            return .get
        case .getHomePageNewsListAPI:
            return .get

        }
    }
    
   //4.请求任务事件
    var task: Task {
        
        //初始化一个空的可变字典
        var parameters : [String : Any] = [:]
        
        switch self {
        case .getHomePageChannelAPI(let siteId, let userId, let type, let size, let regionCode):
            parameters["siteId"] = siteId
            parameters["userId"] = userId
            parameters["type"] = type
            parameters["size"] = size
            parameters["regionCode"] = regionCode
        case .getHomePageNewsListAPI(let siteId, let channelId, let regionCode, let userId, let  pageIndex, let pageSize):
            parameters["siteId"] = siteId
            parameters["channelId"] = channelId
            parameters["regionCode"] = regionCode
            parameters["userId"] = userId
            parameters["pageIndex"] = pageIndex
            parameters["pageSize"] = pageSize
        }
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
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
