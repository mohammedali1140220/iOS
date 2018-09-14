//
//  UserViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// Define UserViewController as UIViewController
// Used: display user indormation


// define libraries 
import UIKit


// define class 
class UserViewController: UIViewController {

    // define IBOutlet name 
    @IBOutlet weak var name: UILabel!
    
    // define IBOutlet phone 
    @IBOutlet weak var phone: UILabel!
    
    // define IBOutlet email 
    @IBOutlet weak var email: UILabel!
    
    // define IBOutlet website 
    @IBOutlet weak var website: UILabel!
    
    // define IBOutlet street 
    @IBOutlet weak var street: UILabel!
    
    // define IBOutlet suite 
    @IBOutlet weak var suite: UILabel!
    
    // define IBOutlet city 
    @IBOutlet weak var city: UILabel!
    
    // define IBOutlet zipcode 
    @IBOutlet weak var zipcode: UILabel!
    
    // define IBOutlet companyName 
    @IBOutlet weak var companyName: UILabel!
    
    // define IBOutlet companyCatchPhrase 
    @IBOutlet weak var companyCatchPhrase: UILabel!
    
    // define IBOutlet companyBs 
    @IBOutlet weak var companyBs: UILabel!
    
    // define user variable to save information
    var user = User()
    
    // declare viewDidLoad Function
    override func viewDidLoad() {
        
        // call the super function
        super.viewDidLoad()
        
        // setup user information
        self.setupInformation()
        
    }
    
    /*
    Name: setupInformation
    Used: binding varaible with user information
    **/
    func setupInformation(){
        
        // set name label to user name 
        self.name.text = user.name
        
        // set phone label to user phone
        self.phone.text = user.phone
        
        // set email label to user email
        self.email.text = user.email
        
        // set website label to user website
        self.website.text = user.website
        
        // set address.street label to user address.street
        self.street.text = user.address.street
        
        // set address.suite label to user address.suite
        self.suite.text = user.address.suite
        
        // set address.city label to user address.city
        self.city.text = user.address.city
        
        // set address.zipcode label to user address.zipcode
        self.zipcode.text = user.address.zipcode
        
        // set company.name label to user company.name
        self.companyName.text = user.company.name
        
        // set company.bs label to user company.bs
        self.companyBs.text = user.company.bs
        
        // set companyCatchPhrase.text label to user companyCatchPhrase.text
        self.companyCatchPhrase.text = user.company.catchPhrase
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
