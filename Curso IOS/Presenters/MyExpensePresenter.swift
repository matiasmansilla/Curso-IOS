//
//  MyExpensePresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol MyExpenseSelectorDelegate: class{
    func myExpenseWasSelected(_ myExpense: MyExpense)
}

protocol MyExpenseViewProtocol: class {
    func navigateToNewExpense()
    func showMyExpenses(myExpenses: [MyExpense])
    func navigateToMyExpenseDetail()
    func navigateToHomescreen()
}

class MyExpensePresenter{
    let repository = MyExpensesRepository()
    var myExpenses : [MyExpense] = []
    var delegate : MyExpenseSelectorDelegate?
    //var myExpenseSelected: MyExpense?
    
    weak var view: MyExpenseViewProtocol?
    
    init(view: MyExpenseViewProtocol) {
        self.view = view
    }
    
}

extension MyExpensePresenter: MyExpensePresenterProtocol{
        func logout() {
        SessionHelper().cleanSession()
        view?.navigateToHomescreen()
    }
    
    func fetchdata() {
        repository.getMyExpenses { (myExpenses, error) in
            self.myExpenses = myExpenses ?? []
            self.view?.showMyExpenses(myExpenses: myExpenses ?? [])
            
        }
    }
    
    func elementSelected(at index: Int) {
        let myExpenseSelected = myExpenses[index]
        delegate?.myExpenseWasSelected(myExpenseSelected)
    }
    
    func newExpenseTapped() {
    self.view?.navigateToNewExpense()
    }
}



