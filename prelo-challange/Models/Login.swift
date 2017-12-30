//
//  Login.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import Foundation

class Login: Decodable{
    var _id: String
    var username: String
    var email: String
    var fullname: String
    var token: String
    
    init() {
        self._id = ""
        self.username = ""
        self.email = ""
        self.fullname = ""
        self.token = ""
    }
}
