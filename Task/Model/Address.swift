//
//  Address.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// define struct Address
//
// used to define the address of the user 

import Foundation

struct Address: Codable{
    
    /*
     id
     Defualt value: 0
     Used: save user's ID
     **/
    var street: String
    
    /*
     name
     Defualt value: ""
     Used: save user's name
     **/
    var suite : String
    
    /*
     id
     Defualt value: 0
     Used: save user's ID
     **/
    var city: String
    
    /*
     name
     Defualt value: ""
     Used: save user's name
     **/
    var zipcode : String
    
    /*
     id
     Defualt value: 0
     Used: save user's ID
     **/
    var geo: Geo
    
    // defualt init
    init (){
        
        // set street value to ""
        self.street = ""
        
        // set suite value to ""
        self.suite = ""
        
        // set city value to ""
        self.city = ""
        
        // set zipcode value to ""
        self.zipcode = ""
        
        // set geo value as empty Geo
        self.geo = Geo()
        
    }
    
    // init from response
    init (responseData: NSDictionary){
        
        // defualt init
        self.init()
        
        // set street from response
        if let street = responseData[CodingKeys.street.stringValue] as? String {
            
            // set street value
            self.street = street
        }
        
        // set suite from response
        if let suite = responseData[CodingKeys.suite.stringValue] as? String {
            
            // set suite value
            self.suite = suite
        }
        
        // set city from response
        if let city = responseData[CodingKeys.city.stringValue] as? String {
            
            // set city value
            self.city = city
        }
        
        // set zipcode from response
        if let zipcode = responseData[CodingKeys.zipcode.stringValue] as? String {
            
            // set zipcode value
            self.zipcode = zipcode
        }
        
        // set geo from response
        if let geo = responseData[CodingKeys.geo.stringValue] as? NSDictionary {
            
            // set geo value
            self.geo = Geo(responseData: geo )
        }
    }
    
    // define coding keys
    enum CodingKeys: String, CodingKey{
        
        // define street case
        case street
        
        // define suite case
        case suite
        
        // define city case
        case city
        
        // define zipcode case
        case zipcode
        
        // define geo case
        case geo
        
    }
    
}
