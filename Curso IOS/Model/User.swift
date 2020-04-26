

import Foundation
import ObjectMapper

class User: Mappable {
    var name: String?
    var token: String?
    
    required init?(map: Map) {}
        func mapping(map: Map) {
            name <- map["name"]
            token <- map["authToken"]
        
    }
}
