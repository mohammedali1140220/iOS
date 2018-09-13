//
//  Photo.swift
//  Task
//
//  Created by Radix on 9/11/18.
//  Copyright © 2018 Radix. All rights reserved.
//
// define structre Photo

import Foundation

struct Photo: Codable{
    
    /*
     id
     Defualt value: 0
     Used: save image id
     **/
    var id: Int
    
    /*
     albumId
     Defualt value: 0
     Used: save album id
     **/
    var albumId : Int
    
    /*
     title
     Defualt value: ""
     Used: save image title
     **/
    var title: String
    
    /*
     url
     Defualt value: ""
     Used: save image url
     **/
    var url: String
    
    /*
     thumbnilURL
     Defualt value: ""
     Used: save image thumbnil url
     **/
    var thumbnilURL : String
    
    // defualt init
    init(){
        
        // set id to 0
        self.id = 0
        
        // set album id to 0
        self.albumId = 0
        
        // set title to ""
        self.title = ""
        
        // set url to ""
        self.url = ""
        
        // set thumbnailURL to ""
        self.thumbnilURL = ""
    }
    
    // init from response
    init (response: NSDictionary){
        
        // defualt init
        self.init()
        
        // set id from response
        if let id = response[CodingKeys.id.stringValue] as? Int {
            
            // set id
            self.id = id
        }
        
        // set albumId from response
        if let albumId = response[CodingKeys.albumId.stringValue] as? Int {
            
            // set albumId
            self.albumId = albumId
        }
        
        // set title from response
        if let title = response[CodingKeys.title.stringValue] as? String {
            
            // set title
            self.title = title
        }
        
        // set url from response
        if let url = response[CodingKeys.url.stringValue] as? String {
            
            // set url
            self.url = url
        }
        
        // set thumbnailURL from response
        if let thumbnilUrl = response[CodingKeys.thumbnilURL.stringValue] as? String {
            
            // set thumbnailURL
            self.thumbnilURL = thumbnilUrl
        }
    }
    
    // define DocingKeys
    enum CodingKeys: String, CodingKey {
        
        // define id case
        case id
        
        // define albumId case
        case albumId
        
        
        // define title case
        case title
        
        
        // define url case
        case url
        
        // define thumbnailURL case
        case thumbnilURL = "thumbnailUrl"
    }
    
}
