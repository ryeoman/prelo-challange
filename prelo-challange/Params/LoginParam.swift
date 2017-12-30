//
//  LoginParam.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//
import UIKit

class LoginParam{
    var username_or_email: String?
    var password: String?
    
    init(username_or_email: String, password: String) {
        self.username_or_email = username_or_email
        self.password = password
    }
    
    func toJson() -> [String : Any]{
        return [
            "username_or_email" : self.username_or_email ?? "",
            "password": self.password ?? ""
        ]
    }
}
