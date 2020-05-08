//
//  CategoriesRepository.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
 
class CategoriesRepository: BaseRepository {
    
    func getCategories(completion: @escaping (_ success: Bool, _ categories: [Category], _ error: String?) -> Void) {
        requestBuilder.categories().responseArray { (response: DataResponse<[Category]>) in
            switch response.result {
            case .success:
                completion(true, response.value ?? [], nil)
            case .failure:
                completion(false, [], self.getError(from: response))
            }
        }
    }
}
