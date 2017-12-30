//
//  LoginRequest.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginRequest {
    class func call(loginParam: LoginParam, callback: @escaping (Bool, Login?) -> ()) {
        
        HttpRequest.execute(url: Constant.login, method: .post, body: loginParam.toJson(), headers: ApiParameter.header) { (success, response) in
            if success{
                let json = JSON(response as Any)
                let login = Login(json: json["_data"])
                UserInfo.instance.seLogintatus(login: login)
                callback(true, login)
            }else{
                let json = JSON(response as Any)
                let login = Login(json: json)
                callback(false, login)
            }
        }
    }
}
