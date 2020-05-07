//
//  NewExpensePresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 06/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol NewExpenseViewProtocol: class {
    func navigateToAccountSelector()
    func navigateToCategorySelector()
    func navigateToProviderSelector()
    //func showAccount()
    func navigateToHomescreen()
}

class NewExpensePresenter {
    
    weak var view: NewExpenseViewProtocol?
    
    init(view: NewExpenseViewProtocol) {
        self.view = view
    }
    

        
}


extension NewExpensePresenter: NewExpensePresenterProtocol {
    func accountTapped() {
        view?.navigateToAccountSelector()
    }
    
    func categoryTapped() {
        view?.navigateToCategorySelector()
    }
    
    func providerTapped() {
        view?.navigateToProviderSelector()
    }
    
    func createTapped() {
        print("create Tapped")
    }
    
    func logout(){
    SessionHelper().cleanSession()
    view?.navigateToHomescreen()
    }
}
