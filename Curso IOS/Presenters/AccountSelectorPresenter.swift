//
//  AccountSelectorPresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol AccountSelectorViewProtocol: class {
    func show(accounts: [Account])
}

class AccountSelectorPresenter {
    
    let repository = AccountRepository()
    var accounts: [Account] = []
    weak var view: AccountSelectorViewProtocol?
    
    init(view: AccountSelectorViewProtocol?) {
        self.view = view
    }
    
}

extension AccountSelectorPresenter: SelectorPresentProtocol{
    func fetchData() {
        repository.getAccounts { (accounts, error) in
            self.accounts = accounts ?? []  //guardamos account
            
            self.view?.show(accounts: accounts ?? [])   //muestra los datos
        }
    }
    
    func elementSelected(at index : Int) {
        let selectedAccount = accounts[index]
        print(selectedAccount.name ?? "")

    }
    
    
}
