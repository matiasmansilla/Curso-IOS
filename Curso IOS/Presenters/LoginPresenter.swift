//
//  LoginPresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 03/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: class {
    func show(error: String)
    func showLoginSucess()
}//end of protocol

class LoginPresenter{
    
    weak var view: LoginViewProtocol?
    let repository = AuthRepository()
    
    init (view: LoginViewProtocol){
        self.view = view  
    }
    
}

extension LoginPresenter: LoginPresenterProtocol{
    func login(username: String, password: String) {
        repository.login(username: username, password: password) { (user, error) in
            if let user = user {
                SessionHelper().save(user : user)
                self.view?.showLoginSucess()
            } else {
                self.view?.show(error: error ?? "Ocurrio un error")
            }
            
        }

    }
    
    
}

