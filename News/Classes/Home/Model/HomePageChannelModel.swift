//
//  HomePageChannelModel.swift
//  News
//
//  Created by melo on 2020/7/21.
//  Copyright © 2020 陈诚. All rights reserved.
//

import Foundation
import HandyJSON

class HomePageChannelModel : HandyJSON {
    
    var status : Int! //频道状态
    var channelIcon : String? //频道图标
    var type : Int! //频道类型
    var channelName : String? //频道名称
    var channelId : String? //频道Id
    
    //class里面必须实现
    required init() {}
}
