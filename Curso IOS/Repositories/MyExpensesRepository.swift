//
//  MyExpensesRepository.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class MyExpensesRepository: BaseRepository{
    
    func getMyExpenses(completion: @escaping([MyExpense]?, String?) -> Void ){
        requestBuilder.myExpenses().responseArray { (dataResponse: DataResponse<[MyExpense]>) in
            switch dataResponse.result{
            case.success:
                completion(dataResponse.value, nil)
            case.failure:
                completion(nil, self.getError(from: dataResponse))
            }
        }
    }
}
