//
//  Category.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import ObjectMapper
 
class Category: Mappable {
    
    var id: Int?
    var needsNumberOfItemsInExpenses : Bool?
    var name: String?
    var description: String?
    
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        needsNumberOfItemsInExpenses <- map["needsNumberOfItemsInExpenses"]
        description <- map["description"]
        name <- map["name"]
        description <- map["description"]
    }
}
