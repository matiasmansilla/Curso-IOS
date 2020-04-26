//
//  ErrorResponse.swift
//  expenses
//
//  Created by Gastón Sobrevilla on 13/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//
 
import Foundation
import ObjectMapper
 
class ErrorResponse: Mappable {
    
    var error: String = "Ocurrió un error"
    
    init() {}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        error <- map["error"]
    }
}
