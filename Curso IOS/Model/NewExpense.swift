//
//  NewExpense.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import ObjectMapper
 
class NewExpense: Mappable {
    
    var description: String?
    var amount: Double?
    var accountId: Int?
    var categoryId: Int?
    var providerId: Int?
    var numberOfItems: Int?
 
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        description <- map["description"]
        amount <- map["amount"]
        accountId <- map["accountId"]
        categoryId <- map["categoryId"]
        providerId <- map["providerId"]
        numberOfItems <- map["numberOfItems"]
    }
}


