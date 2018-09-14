//
//  ExtendUsersViewController.swift
//  Task
//
//  Created by Ghaleb Khaled on 9/14/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Name: ExtendUsersViewController
// Used: define all table view functionality

// import libraries
import UIKit
import Alamofire

// extend to UsersViewController
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    /*
     Name: setupTableView
     Used: setup Table View
     **/
    func setupTableView(){
        
        // append table view to deleget
        self.tableView.delegate = self
        
        // append table view to data source
        self.tableView.dataSource = self
        
        // define nib from nibfile
        let nib = UINib(nibName : "UserTableViewCell", bundle: nil)
        // register nib file to table view
        tableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
        
        // define nib from LoadMoreTableViewCell nib file
        let loadMore = UINib(nibName: "LoadMoreTableViewCell", bundle: nil)
        
        // register loadMore to table view
        self.tableView.register(loadMore, forCellReuseIdentifier: "LoadMoreTableViewCell")
    }
    
    // define number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if users.count == 0{
            return 1
        }
        return users.count
    }
    
    // define cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if users.count == 0 {
            let loadMore = self.tableView.dequeueReusableCell(withIdentifier: "LoadMoreTableViewCell", for: indexPath) as! LoadMoreTableViewCell
            return loadMore
        }
        // define/ruser cell from dequeueReusableCell function
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        // retunr cell from the function handle cell
        return cell.handleCell(cell: cell, indexPathRow: indexPath.row, users: users)
    }
    
    // define estimatedHeightForRowAt
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // return estimated height for raw
        return 50
    }
    
    //define the height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // if there is no data
        if users.count == 0 {
            
            // return the height for the table
            return self.tableView.frame.height
        }
        
        // return automatic height for each cell
        return UITableViewAutomaticDimension
    }
    
    // select the row which was selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // select the user form indexPath.row
        self.user = self.users[indexPath.row]
        
        // perform segue with its identifier to move to new view controller
        performSegue(withIdentifier: "userInformation", sender: self)
    }
    
    // define function prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // define ViewController for segue destination
        let vc = segue.destination as! UserViewController
        
        // send the user variable to the next view controller
        vc.user = self.user
    }
}
