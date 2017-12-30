//
//  Constant.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//
import Alamofire

struct Constant {
    static let login: String = "https://dev.prelo.id/api/auth/login"
    static let lovelist: String = "https://dev.prelo.id/api/me/lovelist/:page"
}

class ApiParameter{
    static let header = [
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    class func authorization() -> HTTPHeaders{
        let token = UserInfo.instance.getAuthStatus().token
        
        let param = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Token " + token
        ]
        
        return param
    }
}
