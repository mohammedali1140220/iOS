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
class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    // define unwind segue to return back to this view controller 
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
        
        // define dismiss dunction to add aniamtion
        dismiss(animated: true, completion: nil)
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
        let user = User(response: (responseData as? NSDictionary)!)
        
        // add user to the array
        self.users.append(user)
    }
    
    
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
    }
    
    // define number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    // define cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // define/ruser cell from dequeueReusableCell function
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        // retunr cell from the function handle cell
        return cell.handleCell(cell: cell, indexPathRow: indexPath.row, users: users)
    }
    
    // define estimatedHeightForRowAt
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //define the height for each row 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
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
        
        // check
        if segue.identifier == "userInformation" {
            
        }
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
