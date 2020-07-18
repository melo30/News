//
//  File.swift
//  News
//
//  Created by melo on 2020/7/13.
//  Copyright © 2020 陈诚. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//协议
protocol NetworkToolProtocol {
    // 我的mine
    // 我的界面cell的数据
    static func loadMyCellData(completionHandler: @escaping(_ sections:[[MyCellModel]]) -> ())
    //我的关注数据
    static func loadMyConcern()
}

//协议的扩展
extension NetworkToolProtocol {
    
    // 我的mine
    // 我的界面cell的数据
    static func loadMyCellData(completionHandler: @escaping (_ sections:[[MyCellModel]]) -> ()) {
        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id": device_id]
        
        AF.request(url, parameters: params).responseJSON { (response) in
            guard (response.value != nil) else {
                //网络错误信息
                return
            }
            if let value = response.value {
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                if let data = json["data"].dictionary {
                    if let sections = data["sections"]?.array {
                        var sectionArray = [[MyCellModel]]()
                        for item in sections {
                            var rows = [MyCellModel]()
                            for row in item.arrayObject! {
                                let myCellModel = MyCellModel.deserialize(from: row as? NSDictionary)
                                rows.append(myCellModel!)
                            }
                            sectionArray.append(rows)
                        }
                        completionHandler(sectionArray)
                    }
                }
            }
        }
        
    }
    //我的关注数据
    static func loadMyConcern() {
        
    }
}

struct NetworkTool: NetworkToolProtocol {
    
}
