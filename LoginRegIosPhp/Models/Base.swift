//
//  Base.swift
//  LoginRegIosPhp
//
//  Created by ah on 10/18/19.
//  Copyright © 2019 boshra. All rights reserved.
//

import Foundation

protocol BaseModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class Base: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: BaseModelProtocol!
    
    let urlPath = "https://russian-bath.000webhostapp.com/services_tuts/services_swift.php" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
                
                
            }
            
        }
        
        task.resume()
    }
    
    
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let users = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let user = User()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let firstName = jsonElement["first_name"] as? String,
                let lastName = jsonElement["last_name"] as? String,
                let userName = jsonElement["user_name"] as? String,
                let password = jsonElement["password"] as? String
            {
                
                user.fname = firstName
                user.lname = lastName
                user.uName = userName
                user.password = password
                
            }
            
            users.add(user)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: users)
            
        })
    }
    
}
