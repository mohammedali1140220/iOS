//
//  TableViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Class name: UsersViewController
// Used: display list of all users from the response to table view 

// import libraries 
import UIKit
import Alamofire

//make class of type UIViewController conform to UITableViewDataSource and UITableViewDelegate protocols  
class UsersViewController: UIViewController{
    
    // create IBoutlet to connect to table view 
    @IBOutlet weak var tableView: UITableView!
    
    // define array of users to save all users from response 
    var users : [User] = []
    
    // define user variable to save user will send to next ViewController 
    var user = User()
    
    // override viewDidLoad function 
    override func viewDidLoad() {
        
        // call the super function 
        super.viewDidLoad()
        
        // get user from api 
        self.setupUsers()
        
        // setup table view controller 
        self.setupTableView()
    }
    
    /*
    Name: setupUsers
    Used: send request and recive response and save it in users array 
    **/
    func setupUsers(){
        // send request using Alamofire library
        Alamofire.request(APIRouter.getUsers).responseJSON{ response in
            
            // check the response result 
            switch response.result {
                
            // case result is success 
            case .success:
                
                // Save response as dictionary
                if let responseData = response.result.value as? [Dictionary<String, AnyObject>]{
                    
                    // save the responseData's count
                    let count = responseData.count
                    
                    // for loop on all dict
                    
                    for i in 0 ... count-1 {
                        // handle the dictionery item with this function
                        self.getRespondeData(responseData: responseData[i])
                    }
                    
                    // reload data when finish api request 
                    self.tableView.reloadData()
                }
                
            // handle case when response.result is failur
            case .failure(let error):
                
                //print the error 
                print (error.localizedDescription)
            }
        }
    }
    
    /*
    Name: 
    Parameters:
    Used: append user to the users array
    **/
    func getRespondeData( responseData : Dictionary<String,Any>){
        
        // define user 
        let user = User(response: (responseData as NSDictionary))
        
        // add user to the array
        self.users.append(user)
    }
    
    // define unwind segue to return back to this view controller
    @IBAction func unWindSegue(_ segue: UIStoryboardSegue) {
        
        // define dismiss function to add aniamtion
        dismiss(animated: true, completion: nil)
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

