//
//  Model.swift
//  MVC Project Demo
//
//  Created by Appinventiv Mac on 20/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import Foundation

struct  User {
    var username:String?
    var password:String?
    var mobile:String?
    var address:String?
    
    init(data:[String:Any]){
        
        username = (data["username"] as? String)
        password = (data["password"] as? String)
        mobile = (data["mobile"] as? String)
        address = (data["address"] as? String)
        
    }
}

    struct Post {
        var username:String?
        var password:String?
        
        init(postData:[String:Any]) {
            
            username = (postData["username"] as? String)
            password = (postData["password"] as? String)
        }
    }

