//
//  SessionHelper.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 05/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

class SessionHelper {
    let defaults = UserDefaults.standard
    let key = "logged_user"
    
    func save(user :User){
        defaults.set(user.toJSONString(), forKey: key)
    }
    
    func getUser() -> User? {
        if let jsonString = defaults.object(forKey: key) as? String {
            return User(JSONString: jsonString)     // Devuelvo un usuario instanciando con el string del JSON
        }
        
        return nil
    }
}
