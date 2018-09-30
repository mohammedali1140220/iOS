//
//  APIRouter.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

// this is for testing 
// new one line added

// define libraries 
import Foundation
import Alamofire

// define enum APIRouter as URLRequestConvertible
enum APIRouter: URLRequestConvertible {
    
    // define case getUsers 
    case getUsers
    
    // define case getPhotos
    case getPhotos
    
    // define the variable method to know the method will use 
    private var method: HTTPMethod{
        
        // check the case 
        switch self {
            
        // case getUsers will return get method 
        case .getUsers:
            
            // return get method 
            return .get
            
         // case getPhotos will return get method 
        case .getPhotos:
            
            // return get method 
            return .get
        }
    }
    
    // define the path 
    private var path: String {
        
        // check the case 
        switch self {
            
        // case getUsers 
        case .getUsers:
            
            // return string
            return "/users"
            
        //case getPhotos
        case .getPhotos:
            
            // return String
            return "/photos"
        }
    }
    
    // define asURLRequest 
    func asURLRequest() throws -> URLRequest {
        
        // define the base url 
        let url = try "https://jsonplaceholder.typicode.com".asURL()
        
        // define the urlRequest appending with path
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // append urlRequest with the method 
        urlRequest.httpMethod = method.rawValue
        
        // json encoding urlRequest
        urlRequest = try JSONEncoding.default.encode(urlRequest)
        
        // return urlRequest
        return urlRequest
    }
    
}
