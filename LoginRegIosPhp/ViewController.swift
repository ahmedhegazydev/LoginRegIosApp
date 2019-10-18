//
//  ViewController.swift
//  LoginRegIosPhp
//
//  Created by ah on 10/18/19.
//  Copyright © 2019 boshra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITabBarDelegate, BaseModelProtocol{
    
     @IBOutlet weak var tableUsers: UITableView!
    var feedItems: NSArray = NSArray()
    var selectedLocation : User = User()

    
    
    
    func itemsDownloaded(items: NSArray) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableUsers.delegate = self
        self.tableUsers.dataSource = self
        
        let downloadProtocol = Base()
        downloadProtocol.delegate = self
        downloadProtocol.downloadItems()
        
    }

    
    
    
    

}

