//
//  API Controller.swift
//  MVC Project Demo
//
//  Created by Appinventiv Mac on 20/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import Foundation


class APIController{
    
    // MARK: Method to handel GET method Request
    
    func signUp(param:[String:Any],success:@escaping(User)->()){
        let headers = [
            "Authorization": "Basic ZXBpY2dlbTpBMG9pOFVubWhZSEhqdTk2OE1MaQ==",
            "Cache-Control": "no-cache",
            "Postman-Token": "d9dee99d-17df-4f8e-8ca2-a0162187d363"
        ]
        let baseURL = "https://httpbin.org/get?"
        let appendURL = self.appendParams(parameters: param)
        let url = URL(string: baseURL+appendURL)
        
        NetworkController().GET(url: url!,headers: headers) { (data) in
            for (key,value) in data {
                if key == "args"{
                    success(User(data: (value as? [String:Any])!))
                }
            }
        }
    
}
    
    // MARK: Method to handel POST method Request
    
    func signUpPOST(param:[String:Any],bodyData: String,success:@escaping(Post)->(),fail: @escaping (String) -> Void){
        let headers = [
            "Authorization": "Basic ZXBpY2dlbTpBMG9pOFVubWhZSEhqdTk2OE1MaQ==",
            "Cache-Control": "no-cache",
            "Postman-Token": "d9dee99d-17df-4f8e-8ca2-a0162187d363"
        ]
        let baseURL = "https://httpbin.org/post?"
        let appendURL = self.appendParams(parameters: param)
        let url = URL(string: baseURL+appendURL)
        NetworkController().POST(url: url!, headers: headers, bodyData: bodyData) { (data) in
            for (key,value) in data {
                if key == "form"{
                    // MARK: SUCCESS callback
                    success(Post(postData: (value as? [String:Any])!))
                }else{
                    // MARK: FAILURE callback
                    fail("No data found")
                }
        }
        }
    }
        
    func appendParams(parameters: [String:Any]) -> String {
    
        var apendString:String = ""
        
            for (key,val) in parameters
            {
                apendString = apendString + key + "=" + (val as! String)
                apendString.append("&")
            }
        
        if  apendString.last == "&"
        {
            apendString.removeLast()
        }
        return apendString
    }
    
}
