//
//  HomePageListModel.swift
//  News
//
//  Created by melo on 2020/7/22.
//  Copyright © 2020 陈诚. All rights reserved.
//

import Foundation
import HandyJSON

class HomePageListModel : HandyJSON {
    var Data : HomePageListData?
    var Code : Int?
    var isSuccess : Bool?
    var Desc : String?
    
    required init() {}
}

class HomePageListData: HandyJSON {
    var list : [HomePageListDataList]?//用中括号包起来代表是s数组模型
    required init() {}
}

class HomePageListDataList: HandyJSON {
    var regionCode : Int?
    var newsTitle : String?
    var userName : String?
    var commentCount : Int?
    var newsPublishTime : String?
    var newsType : String?
    var newsCoverList : Array<String>?
    
    required init() {}
}
