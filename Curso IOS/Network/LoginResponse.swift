//
//  LoginResponse.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 17/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse: Mappable {
    
    var user: User?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        user <- map["user"]
    }
}

