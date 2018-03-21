//
//  NetworkController.swift
//  MVC Project Demo
//
//  Created by Appinventiv Mac on 20/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import Foundation

class NetworkController {
    
    
   
    func GET(url:URL,headers:[String:String], success:@escaping ([String:Any])->Void){
        
        let request = NSMutableURLRequest(url: url ,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            do{
                if let err = error {
                    print(err)
                }else{
                    if let httpResponse = response {
                        //  print(httpResponse)
                    }
                }
                guard let data=data else { return }
                let jsonData = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                
//                print(jsonData)
                
                success(jsonData as! [String : Any])
            }catch {
                print("JSON Serialization Caught an Error")
            }
        })
        
        dataTask.resume()
        
    }
    
    func POST(url:URL,headers:[String:String],bodyData:String, success:@escaping ([String:Any]) -> Void){
        
        let request = NSMutableURLRequest(url: url ,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
      
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            do{
                if let err = error {
                    print(err)
                }else{
                    if let httpResponse = response {
                        //  print(httpResponse)
                    }
                }
                guard let data=data else { return }
                let jsonData = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                
                                print(jsonData)
                
                success(jsonData as! [String : Any])
            }catch {
                print("JSON Serialization Caught an Error")
            }
        }).resume()
        
        }
        
    }
    
   

