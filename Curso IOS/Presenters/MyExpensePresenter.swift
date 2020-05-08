//
//  MyExpensePresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol MyExpenseViewProtocol: class {
    func navigateToNewExpense()
//    func navigateToAccountSelector(delegate: AccountSelectorDelegate)
//    func navigateToCategorySelector(delegate: CategorySelectorDelegate)
//    func navigateToProviderSelector( categoryId: Int, delegate: ProviderSelectorDelegate)
//    func showAccount()

    
}

class MyExpensePresenter{
    let repository = MyExpensesRepository()
    weak var view: MyExpenseViewProtocol?
//
//    var selectedAccount: Account?
//    var selectedCategory: Category?
//    var selectedProvider: Provider?
//    var amount: Double?
//    var description: String?
//    var quantity: Int?

    
    init(view: MyExpenseViewProtocol) {
        self.view = view
    }
    
}

extension MyExpensePresenter: MyExpensePresenterProtocol{
    func newExpenseTapped() {
    self.view?.navigateToNewExpense()
    }
    
    
}
