//
//  UserInfo.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit

class UserInfo{
    
    static let instance = UserInfo()
    
    let pref =  UserDefaults.standard
    
    func getAuthStatus() -> Login {
        let login = Login()
        if let _id = pref.string(forKey: "_id"){
            login._id = _id
        }
        
        if let email = pref.string(forKey: "email"){
            login.email = email
        }
        
        if let fullname = pref.string(forKey: "fullname") {
            login.fullname = fullname
        }
        
        if let token = pref.string(forKey: "token") {
            login.token = token
        }
        
        if let username = pref.string(forKey: "username"){
            login.username = username
        }
        
        return login
    }
    
    func seLogintatus(login: Login){
        pref.set(login._id, forKey: "_id")
        pref.set(login.email, forKey: "email")
        pref.set(login.fullname, forKey: "fullname")
        pref.set(login.token, forKey: "token")
        pref.set(login.username, forKey: "username")
    }
}
