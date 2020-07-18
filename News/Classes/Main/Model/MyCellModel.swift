//
//  MyCellModel.swift
//  News
//
//  Created by melo on 2020/7/13.
//  Copyright © 2020 陈诚. All rights reserved.
//  我的cell返回数据的Model

import Foundation
import HandyJSON //HandyJSON是字典转模型，是一个协议，每个结构体都要遵循

struct MyCellModel: HandyJSON {
    var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: Int = 0
}

struct MyConcern: HandyJSON {//属性要么给个初始值，要么就价格问号变成可选
    var name: String?
    var url: String?
    var total_count: Int?
    var discription: String?
    var time: String?
    var type: String?
    var icon: String?
    var userid: String?
    var is_verify: Bool?
    var media_id: Int?
    var tips: Bool?
    var id: Int?
    var user_auth_info: String?//由于user_auth_info它是一个字符串类型的字典，要让他转化成标准字典，处理方法是，再定义一个结构体UserAuthInfo，然后
    
    var userAuthInfo: UserAuthInfo? {
        return UserAuthInfo.deserialize(from:user_auth_info)
    }
}

struct UserAuthInfo:HandyJSON {
    var auth_type: Int?
    var auth_info: String?
}
