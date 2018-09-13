//
//  Company.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// define struct Company


import Foundation

struct Company: Codable {
    
    /*
     name
     Defualt value: ""
     Used: save Company name
     **/
    var name: String
    
    /*
     catchPhrase
     Defualt value: ""
     Used: save company catchPhrase
     **/
    var catchPhrase : String
    
    /*
     bs
     Defualt value: ""
     Used: save company bs
     **/
    var bs: String
    
    
    // defualt init
    init (){
        
        // define name default value
        self.name = ""
        
        // define catchPhrase default value
        self.catchPhrase = ""
        
        // define bs defualt value
        self.bs = ""
        
    }
    
    // define init with NSDitionery
    init ( response: NSDictionary ){
        
        // define default value
        self.init()
        
        // set name from response
        if let name = response[CodingKeys.name.stringValue] as? String {
            
            // set name
            self.name = name
        }
        
        // set catchPhrse from response
        if let catchPhrase = response[CodingKeys.catchPhrase.stringValue] as? String {
            
            // set catchPhrase
            self.catchPhrase = catchPhrase
        }
        
        // set bs from response
        if let bs = response[CodingKeys.bs.stringValue] as? String {
            
            // set bs
            self.bs = bs
        }
        
    }
    
    // define coding keys
    enum CodingKeys: String, CodingKey{
        
        // define name case
        case name
        
        // define catchPhrase case
        case catchPhrase
        
        // define bs case
        case bs
    }
    
    
}
