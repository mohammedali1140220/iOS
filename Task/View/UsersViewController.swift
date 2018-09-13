//
//  TableViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

import UIKit
import Alamofire

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.setupUsers()
        
        self.setupTableView()
       
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupUsers(){
        Alamofire.request(APIRouter.getUsers).responseJSON{ response in
            
            switch response.result {
            case .success:
                
                // Save response as dictionary
                if let responseData = response.result.value as? [Dictionary<String, AnyObject>]{
                    
                    let count = responseData.count
                    
                    for i in 0 ... count-1 {
                        print(responseData[0])
                        self.getRespondeData(responseData: responseData[i])
                    }
                    //self.performSegue(withIdentifier: "user", sender: self)
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print (error.localizedDescription)
            }
        }
    }
    
    func getRespondeData( responseData : Dictionary<String,Any>){
        
        // succesfully logged in
        // status code will return status code =200
        
        let user = User(response: (responseData as? NSDictionary)!)
        self.users.append(user)
        
    }
    
    
    func setupTableView(){
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName : "UserTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        return cell.handleCell(cell: cell, indexPathRow: indexPath.row, users: users)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.user = self.users[indexPath.row]
        performSegue(withIdentifier: "userInformation", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UserViewController
        vc.user = self.user
        if segue.identifier == "userInformation" {
            
        }
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
