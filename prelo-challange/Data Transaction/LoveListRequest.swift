//
//  LoveListRequest.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoveListRequest {
    class func call(page: Int, callback: @escaping (Bool, [LoveItem]?) -> ()) {
        let url = Constant.lovelist.replacingOccurrences(of: ":page", with: "\(page)")
        var loveList = [LoveItem]()
        
        HttpRequest.execute(url: url, method: .get, body: [:], headers: ApiParameter.authorization()) { (success, response) in
            if success{
                let json = JSON(response as Any)
                for (_, subjson) in json["_data"]{
                    let loveItem = LoveItem(json: subjson)
                    loveList.append(loveItem)
                }
                callback(true, loveList)
            }else{
                callback(false, loveList)
            }
        }
    }
}
