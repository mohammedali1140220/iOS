//
//  APIRouter.swift
//  Task
//
//  Created by Radix on 9/10/18.
//  Copyright © 2018 Radix. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getUsers
    
    case getPhotos
    
    private var method: HTTPMethod{
        switch self {
        case .getUsers:
            return .get
        case .getPhotos:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getUsers:
            return "/users"
            
        case .getPhotos:
            return "/photos"
        }
        
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try "https://jsonplaceholder.typicode.com".asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getUsers:
            urlRequest = try JSONEncoding.default.encode(urlRequest)
            break
            
        case .getPhotos:
            
            urlRequest = try JSONEncoding.default.encode(urlRequest)
            break
        }
        
        
        print(type(of: urlRequest))
        return urlRequest
    }
    
}
