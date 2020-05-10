//
//  MyExpense.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import ObjectMapper
 
class MyExpense: Mappable {
    var amount: Double?
    var account: Account?
    var category: Category?
    var expenseId: Int?
    var numberOfItems: Int?
    var provider: Provider?
    var description: String?
    var createdAt: String?
    var user: UserApp?
    
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        amount <- map["amount"]
        account <- map["account"]
        category <- map["category"]
        expenseId <- map["id"]
        numberOfItems <- map["numberOfItems"]
        provider <- map["provider"]
        description <- map["description"]
        createdAt <- map["createdAt"]
        user <- map["user"]
        

    }
}
