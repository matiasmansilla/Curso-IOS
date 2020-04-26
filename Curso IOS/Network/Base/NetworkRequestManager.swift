//
//  NetworkRequestManager.swift
//  expenses
//
//  Created by Gastón Sobrevilla on 13/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//
 
import Foundation
import Alamofire
 
class NetworkRequestManager {
}
 
extension NetworkRequestManager: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        // here customize all requests
        return urlRequest
    }
}

