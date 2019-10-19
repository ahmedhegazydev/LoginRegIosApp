//
//  SaveViewController.swift
//  LoginRegIosPhp
//
//  Created by ah on 10/18/19.
//  Copyright © 2019 boshra. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController {

    let urlRegister = "https://russian-bath.000webhostapp.com/services_tuts/register.php"
    
    @IBOutlet weak var tfFirstName: UITextField!
    
    @IBOutlet weak var tfLastName: UITextField!
    
    @IBOutlet weak var tfUserName: UITextField!
    
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tvConfirmPasswodr: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load saving VC")
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //registerUser(url: urlRegister)
        registerUser2(url : urlRegister)
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        print("btn register clicked")
        
        //registerUser(url: urlRegister)
        
    }
    
    
    func registerUser2(url : String){
        //created NSURL
        let requestURL = NSURL(string: urlRegister)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
//        let teamName=textFieldName.text
//        let memberCount = textFieldMember.text
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "username=Ahmed username&password=20130074&name=Ahmed Mohamed&email=wowrar1234@gmail.com&phone=01156749640";
//        let postParameters = [
//            "username" : "Ahmed username",
//            "password":"20130074",
//            "name" : "Ahmed Mohamed",
//            "email":"wowrar1234@gmail.com",
//            "phone":"01156749640"
//            ] as [String: Any]
        
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                //parsing the json
                if let parseJSON = myJSON {
                    //creating a string
                    var msg : String!
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    //printing the response
                    print(msg)
                }
            } catch {
                print(error)
            }
        }
        //executing the task
        task.resume()
    }
    
    func registerUser(url : String) {
        let Url = String(format: url)
        guard let serviceUrl = URL(string: Url) else { return }
//        let parameterDictionary = [
//            "username" : self.tfUserName.text!,
//            "password":self.tfPassword.text!,
//            "name" : self.tfUserName.text!,
//            "email":self.tfEmail.text!,
//             "phone":self.tfPhoneNumber.text!
//            ] as [String : Any]
        
        
        let parameterDictionary = [
            "username" : "Ahmed username",
            "password":"20130074",
            "name" : "Ahmed Mohamed",
            "email":"wowrar1234@gmail.com",
            "phone":"01156749640"
            ] as [String : Any]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }

}
