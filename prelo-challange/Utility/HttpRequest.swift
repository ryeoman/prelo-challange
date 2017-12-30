//
//  HttpHelper.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import Alamofire

class HttpRequest {
    class func execute(url : String, method: HTTPMethod, body: Parameters, headers: HTTPHeaders, callback: @escaping (_ result: Bool, _ response: Any?) -> Void){
        Alamofire.request(url, method: method, parameters: body, encoding: URLEncoding.default, headers: headers)
            .responseJSON{ response in
                
                let statusCode = response.response?.statusCode
                
                switch statusCode!{
                case 200:
                    callback(true, response.result.value)
                    break
                case 400:
                    print("Bad Request")
                    callback(false, response.result.value)
                    break
                default:
                    print(">> StatusCode /n" + String(describing: statusCode))
                    print("----------------------- Request --------------------------------")
                    print(response.request?.allHTTPHeaderFields ?? "response.request?.allHTTPHeaderFields")
                    print(String(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8) as String!)
                    print("----------------------- Response --------------------------------")
                    print(response.response?.allHeaderFields ?? "response.response?.allHeaderFields")
                    callback(false, nil)
                    break
                }
        }
    }
}
