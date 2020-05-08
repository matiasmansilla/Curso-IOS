//
//  NewExpensePresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 06/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol NewExpenseViewProtocol: class {
    func navigateToAccountSelector(delegate: AccountSelectorDelegate)
    func navigateToCategorySelector(delegate: CategorySelectorDelegate)
    func navigateToProviderSelector( categoryId: Int, delegate: ProviderSelectorDelegate)
    //func showAccount()
    func navigateToHomescreen()
    
    func showAccountSelected(account: Account)
    func showCategorySelected(category: Category)
    func showProviderSelected(provider: Provider)
    
    func showSuccess(message: String)
    func showError(message: String)
    
}

class NewExpensePresenter {
    
    let repository = ExpenseRepository()
    weak var view: NewExpenseViewProtocol?
    
    var selectedAccount: Account?
    var selectedCategory: Category?
    var selectedProvider: Provider?
    var amount: Double?
    var description: String?
    var quantity: Int?

    
    init(view: NewExpenseViewProtocol) {
        self.view = view
    }
    

        
}


extension NewExpensePresenter: NewExpensePresenterProtocol {
    func accountTapped() {
        view?.navigateToAccountSelector(delegate: self)
    }
    
    func categoryTapped() {
        view?.navigateToCategorySelector(delegate: self)
    }
    
    func providerTapped() {
        if let categoryId = selectedCategory?.id{
            view?.navigateToProviderSelector(categoryId: categoryId, delegate: self)
        } else {
            print("Debe seleccionar una categoria")
        }
        
        
    }
    
    func createTapped(amount: Double, description: String, quantity: Int) {
        self.amount = amount
        self.description = description
        self.quantity = quantity
        
        guard validateInputs() else{return}
        let newExpense = getNewExpense()
        repository.createExpense(expense: newExpense) { (successMsg, errorMsg) in
            
            if errorMsg == nil {
                self.view?.showSuccess(message: successMsg ?? "")
            }else {
                self.view?.showError(message: errorMsg ?? "")
            }
        }
    }
    func getNewExpense() -> NewExpense{
        let newExpense = NewExpense()
        newExpense.amount = amount
        newExpense.description = description
        newExpense.numberOfItems = quantity
        newExpense.accountId = selectedAccount?.id
        newExpense.categoryId = selectedCategory?.id
        newExpense.providerId = selectedProvider?.id
        return newExpense
    }
    
    func validateInputs()->Bool {
        guard selectedAccount != nil else {
            view?.showError(message: "Debe seleccionar una cuenta!")
            return false
        }
        guard selectedCategory != nil else {
            view?.showError(message: "Debe seleccionar una categoria!")
            return false
        }
        guard selectedProvider != nil else {
            view?.showError(message: "Debe seleccionar un proveedor!")
            return false
        }
        guard let amount = amount, amount > 0.0 else {
            view?.showError(message: "Ingrese un monto dstinto de cero!")
            return false
        }
        guard let description = description, !description.isEmpty else {
            view?.showError(message: "Ingrese una descripcion!")
            return false
        }
        guard let quantity = quantity, quantity > 0 else {
            view?.showError(message: "Ingrese una cantidad distinta de cero!")
            return false
        }
        return true
    }
    
    func logout(){
    SessionHelper().cleanSession()
    view?.navigateToHomescreen()
    }
}

extension NewExpensePresenter: AccountSelectorDelegate{
    func accountWasSelected(_ account: Account) {
        view?.showAccountSelected(account: account)
        selectedAccount = account
        
    }
}

extension NewExpensePresenter: CategorySelectorDelegate{
    func categorytWasSelected(_ category: Category) {
        view?.showCategorySelected(category: category)
        selectedCategory = category
    }
}

extension NewExpensePresenter: ProviderSelectorDelegate{
    func providerWasSelected(_ provider: Provider) {
        view?.showProviderSelected(provider: provider)
        selectedProvider = provider

    }
    
    
}
