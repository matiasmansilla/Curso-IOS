//
//  ExpenseDetailPresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 09/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol ExpenseDetailViewProtocol: class {
    func showExpenseDetail(myExpense: MyExpense)
}

class ExpenseDetailPresenter{
    
    weak var view: ExpenseDetailViewProtocol?

     init(view: ExpenseDetailViewProtocol) {
         self.view = view
     }
}

extension ExpenseDetailPresenter : ExpenseDetailPreseterProtocol{
    func setData() {
    }
}

extension ExpenseDetailPresenter: MyExpenseSelectorDelegate{
    func myExpenseWasSelected(_ myExpense: MyExpense) {
        
    }
    
    
}

