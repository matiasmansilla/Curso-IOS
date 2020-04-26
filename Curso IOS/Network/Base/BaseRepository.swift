//
//  HttpRepository.swift
//  expenses
//
//  Created by Gastón Sobrevilla on 13/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//
 
import Foundation
import Alamofire
 
class BaseRepository {
    
    let requestBuilder = ApiRequestBuilder()
    
    func getError<T>(from response: DataResponse<T>) -> String {
        if
            let data = response.data,
            let jsonString = String(data: data, encoding: String.Encoding.utf8),
            var errorResponse = ErrorResponse(JSONString: jsonString) {
            return errorResponse.error
        } else {
            let errorResponse = ErrorResponse()
            return errorResponse.error
        }
    }
}

