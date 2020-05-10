//
//  UserApp.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 09/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import ObjectMapper

class UserApp: Mappable {
    var name: String?
 
    
    required init?(map: Map) {}
        func mapping(map: Map) {
            name <- map["name"]

        
    }
}
