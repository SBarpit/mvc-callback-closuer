//
//  ViewController.swift
//  MVC Project Demo
//
//  Created by Appinventiv Mac on 20/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var passwordLB: UILabel!
    @IBOutlet weak var addressLB: UILabel!
    @IBOutlet weak var mobileLB: UILabel!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    
    // MARK: Class Properties
    
    var poUname:String!
    var poPass:String!
    var username:String!
    var password:String!
    var mobile:String!
    var address:String!
    var parameters = [String:String]()
    var bodyData:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func getSignup(){
        APIController().signUp(param: parameters) { (user) in
            self.username = user.username!
            self.password = user.password!
            self.mobile = user.mobile!
            self.address = user.address!
        }
    }
    
    @IBAction func showdataBT(_ sender: UIButton) {
        
        // MARK: Uncomment this for GET request
        
        self.parameters["username"] = self.usernameTF.text ?? ""
        self.parameters["password"] = self.passwordTF.text ?? ""
        self.parameters["mobile"] = self.mobileTF.text ?? ""
        self.parameters["address"] = self.addressTF.text ?? ""
        
        // MARK: Gemerating body parameters for POST request
        
        bodyData = "username=\(self.usernameTF.text!)&password=\(self.passwordTF.text!)"
        
        // MARK: Uncomment for the get request
        
        //self.getSignup()
        
        // MARK: For post request
        
        self.postSignup()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            
            self.nameLB.text = self.poUname
            self.passwordLB.text = self.poPass
            self.mobileLB.text = self.mobile
            self.addressLB.text = self.address
        })
    }
    
    func postSignup(){
        
        APIController().signUpPOST(param: parameters,bodyData:bodyData, success: { (post) in
            
            // MARK: SUCCESS callback
            
            self.poUname = post.username!
            self.poPass = post.password!
            print(post.username!)
            print(post.password!)
        }) { (error) in
            
            // MARK: FAILURE callback
            
            print(error)
        }
        
    }
}



