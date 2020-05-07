//
//  AccountRepository.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class AccountRepository: BaseRepository{
    
    func getAccounts(completion: @escaping([Account]?, String?) -> Void ){
        requestBuilder.accounts().responseArray { (dataResponse: DataResponse<[Account]>) in
            switch dataResponse.result{
            case.success:
                completion(dataResponse.value, nil)
            case.failure:
                completion(nil, self.getError(from: dataResponse))
            }
        }
    }
}
