//
//  HttpRequestFile.swift
//  News
//
//  Created by melo on 2020/7/21.
//  Copyright © 2020 陈诚. All rights reserved.
//  请求文件汇总(用一个枚举包起来，可以集中直观的看到整个App中有哪些网络请求)

import Foundation

enum HttpRequest {
    //获取首页频道接口
    case getHomePageChannelAPI
    //获取首页新闻列表
    case getHomePageNewsListAPI
}
