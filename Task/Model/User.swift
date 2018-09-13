//
//  User.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// User struct
//
// used to save user's information

import Foundation


struct User: Codable {
    
    
    /*
     id
     Defualt value: 0
     Used: save user's ID
     **/
    var id: Int
    
    /*
     name
     Defualt value: ""
     Used: save user's name
     **/
    var name : String
    
    /*
     userName
     Defualt value: ""
     Used: save user name
     **/
    var userName: String
    
    /*
     email
     Defualt value: ""
     Used: save user's email
     **/
    var email: String
    
    /*
     address
     Defualt value: Address
     Used: save user's address
     **/
    var address : Address
    
    /*
     phone
     Defualt value: ""
     Used: save user's phone
     **/
    var phone : String
    
    /*
     website
     Defualt value: ""
     Used: save user's website
     **/
    var website: String
    
    /*
     position
     Defualt value: Company
     Used: save user's Company
     **/
    var company: Company
    
    // define defualt init
    init() {
        // det id = 0
        self.id = 0
        
        // set name = ""
        self.name = ""
        
        // set userName = ""
        self.userName = ""
        
        // set email = ""
        self.email = ""
        
        // set address as defualt Address (empty address data)
        self.address = Address()
        
        // set phone =  ""
        self.phone = ""
        
        // set website = ""
        self.website = ""
        
        // set company = defualt company (empty company data)
        self.company = Company()
    }
    
    // define init with response
    init ( response: NSDictionary ) {
        
        // set defualt for variable
        self.init()
        
        // set id from response
        if let id = response[CodingKeys.id.stringValue] as? Int {
            // set id
            self.id = id
        }
        
        // set name from response
        if let name = response[CodingKeys.name.stringValue] as? String {
            // set name
            self.name = name
        }
        
        // set userName from response
        if let userName = response[CodingKeys.userName.stringValue] as? String {
            // set userName
            self.userName = userName
        }
        
        // set email from response
        if let email = response[CodingKeys.email.stringValue] as? String {
            // set email
            self.email = email
        }
        
        // set address from response
        if let address = response[CodingKeys.address.stringValue] as? NSDictionary {
            // set address
            self.address = Address(responseData: address)
        }
        
        // set phone from response
        if let phone = response[CodingKeys.phone.stringValue] as? String {
            // set phone
            self.phone = phone
        }
        
        // set website from response
        if let website = response[CodingKeys.website.stringValue] as? String {
            // set website
            self.website = website
        }
        
        // set company from response
        if let company = response[CodingKeys.company.stringValue] as? NSDictionary {
            //set company
            self.company = Company(response: company)
        }
    }
    
    // define CodingKeys
    enum CodingKeys: String, CodingKey{
        
        // define id case
        case id
        
        // define name case
        case name
        
        // define userName case
        case userName = "username"
        
        // define email case
        case email
        
        // define address case
        case address
        
        // define phone case
        case phone
        
        // define website case
        case website
        
        // define company case
        case company
    }
    
}
