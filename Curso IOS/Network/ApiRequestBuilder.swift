//
//  ApiRequestBuilder.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 17/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import Alamofire

class ApiRequestBuilder: HttpRequestBuilder {
    
    init() {
        super.init(baseUrl: "http://dev.expenses.vortexsoftware.com.ar/api/v1/", defaultSessionManager: HttpManager.shared)
    }
    
    func login(username: String, password: String) -> DataRequest {
        let params = [
            "username": username,
            "password": password
        ]
        return buildRequest(path: ApiUrls.login, method: .post, params: params)
    }
    
    func accounts()->DataRequest{
        return buildRequest(path: ApiUrls.accounts, method: .get)
    }
}
