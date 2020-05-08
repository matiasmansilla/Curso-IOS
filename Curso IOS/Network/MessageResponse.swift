//
//  MessageResponse.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import ObjectMapper

class MessageResponse: Mappable {
    var message: String?

    
    required init?(map: Map) {}
        func mapping(map: Map) {
            message <- map["message"]

    }
}
