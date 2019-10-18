//
//  ViewController.swift
//  LoginRegIosPhp
//
//  Created by ah on 10/18/19.
//  Copyright © 2019 boshra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, BaseModelProtocol{
    
    @IBOutlet weak var tableUsers: UITableView!
    var users: NSArray = NSArray()
    var selectedUser : User = User()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of feed items
        return self.users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: User = users[indexPath.row] as! User
        // Get references to labels of cell
        myCell.textLabel!.text = item.fname
        
        return myCell
        
    }
    
    func itemsDownloaded(items users: NSArray) {
        
        self.users = users
        self.tableUsers.reloadData()
        
        
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

