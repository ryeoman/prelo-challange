//
//  LoveItem.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoveItem: NSObject {
    var _id: String?
    var seller_id: String?
    var name: String?
    var category_id: String?
    var brand_id: String?
    var special_story: String?
    var price: Double?
    var price_original: Double?
    var status: Int?
    var free_ongkir: Int?
    var num_lovelist: Int?
    var num_comment: Int?
    var permalink: String?
    var display_picts: [String]?
    var update_time_uuid: String?
    var update_time: String?
    
    override init() {
        super.init()
    }
    
    init(json: JSON){
        self._id = json["_id"].string
        self.seller_id = json["seller_id"].string
        self.name = json["name"].string
        self.category_id = json["category_id"].string
        self.brand_id = json["brand_id"].string
        self.special_story = json["special_story"].string
        self.price = json["price"].double
        self.price_original = json["price_original"].double
        self.status = json["status"].int
        self.free_ongkir = json["free_ongkir"].int
        self.num_lovelist = json["num_lovelist"].int
        self.num_comment = json["num_comment"].int
        self.permalink = json["permalink"].string
        self.display_picts = json["display_picts"].arrayValue.map { $0.stringValue}
        self.update_time_uuid = json["update_time_uuid"].string
        self.update_time = json["update_time"].string
    }
}
