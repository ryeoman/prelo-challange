//
//  Login.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import Foundation
import SwiftyJSON

class Login: NSObject{
    var _id: String?
    var username: String?
    var email: String?
    var fullname: String?
    var token: String?
    
    //failed message
    var _message: String?
    
    override init() {
        super.init()
    }
    
    init(json: JSON) {
        self._id = json["_id"].string
        self.username = json["username"].string
        self.email = json["email"].string
        self.fullname = json["fullname"].string
        self.token = json["token"].string
        
        self._message = json["_message"].string
    }
}
