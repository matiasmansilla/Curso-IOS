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
}

class NewExpensePresenter {
    
    weak var view: NewExpenseViewProtocol?
    
    var selectedAccount: Account?
    var selectedCategory: Category?
    var selectedProvider: Provider?

    
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
        print(selectedAccount?.name)
        print(selectedCategory?.name)
        print(selectedProvider?.name)
        print(amount)
        print(description)
        print(quantity)
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
