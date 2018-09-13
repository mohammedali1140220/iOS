//
//  Geo.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// struct Geo
//
// Used to define the location of the user
//

import Foundation

struct Geo: Codable{
    
    /*
     latitude
     Defualt value: ""
     Used: save user's latitude
     **/
    var latitude: String
    
    /*
     longitude
     Defualt value: ""
     Used: save user's longitude
     **/
    var longitude : String
    
    //defualt init
    init (){
        
        // set longitude to ""
        self.longitude = ""
        
        // set latutude to ""
        self.latitude = ""
    }
    
    // init with dictionary
    init (responseData: NSDictionary){
        
        // defualt init
        self.init()
        
        // set latitue from response
        if let lat = responseData[CodingKeys.latitude.stringValue] as? String {
            
            // set latitude
            self.latitude = lat
        }
        
        // set longitude from response
        if let lng = responseData[CodingKeys.longitude.stringValue] as? String {
            
            // set longitude
            self.longitude = lng
        }
    }
    
    // define coding keys
    enum CodingKeys: String, CodingKey{
        
        // define latitude
        case latitude = "lat"
        
        // define longitude
        case longitude = "lng"
        
    }
    
}
