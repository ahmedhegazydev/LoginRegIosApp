//
//  User.swift
//  LoginRegIosPhp
//
//  Created by ah on 10/18/19.
//  Copyright © 2019 boshra. All rights reserved.
//

import Foundation
class User : NSObject{
    
    var fname : String?
    var lname : String?
    var uName : String?
    var password : String?
    
    
    init(firstName : String, lastName: String, userName : String,password : String) {
        self.fname = firstName
        self.lname = lastName
        self.password = password
        self.uName = userName
        
        
        
    }
    
    //empty constructoe
    override init() {
        
    }
    
    
    //for testing
    override var description: String {
        return "firstname = \(String(describing: self.fname)), lastname = \(String(describing: self.uName)), username = \(String(describing: self.uName)) , password = \(String(describing: self.password)) "
    }
    
}

