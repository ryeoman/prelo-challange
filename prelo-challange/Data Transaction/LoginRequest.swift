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
    class func call(loginParam: LoginParam, callback: @escaping (Login) -> ()) {
        HttpRequest.execute(url: Constant.login, method: .post, body: loginParam.toJson(), headers: ApiParameter.header) { (success, response) in
            if success{
                
            }
        }
    }
}
