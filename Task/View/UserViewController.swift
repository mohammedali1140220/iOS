//
//  UserViewController.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var suite: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var zipcode: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyCatchPhrase: UILabel!
    @IBOutlet weak var companyBs: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupInformation()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupInformation(){
        
        self.name.text = user.name
        self.phone.text = user.phone
        self.email.text = user.email
        self.website.text = user.website
        self.street.text = user.address.street
        self.suite.text = user.address.suite
        self.city.text = user.address.city
        self.zipcode.text = user.address.zipcode
        self.companyName.text = user.company.name
        self.companyBs.text = user.company.bs
        self.companyCatchPhrase.text = user.company.catchPhrase
        
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
