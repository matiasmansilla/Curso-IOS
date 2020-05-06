//
//  NewExpensePresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 06/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol NewExpenseViewProtocol {
    
}

class NewExpensePresenter{
    
    var view: NewExpenseViewProtocol?
    
    init(view: NewExpenseViewProtocol) {
        self.view = view
    }
    

        
}


extension NewExpensePresenter: NewExpensePresenterProtocol {
    func logout(){
    SessionHelper().cleanSession()
    }
}
