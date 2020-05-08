//
//  ExpenseRepository.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import Alamofire

class ExpenseRepository: BaseRepository {
    typealias CreateExpenseCompletion = (String?, String?)-> Void
    func createExpense(expense: NewExpense, completion: @escaping CreateExpenseCompletion ){
        requestBuilder.createExpense(data: expense).responseObject { (dataResponse: DataResponse<MessageResponse>) in
            switch dataResponse.result {
            case .success:
                completion(dataResponse.value?.message, nil)
            case .failure:
                completion(nil, self.getError(from: dataResponse))
            
            }
        }
    }
}
