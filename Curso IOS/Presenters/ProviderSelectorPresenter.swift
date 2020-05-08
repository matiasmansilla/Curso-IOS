//
//  ProviderSelectorPresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol ProviderSelectorViewProtocol: class {
    func show(providers: [Provider])
}

class ProviderSelectorPresenter {
    
    let repository = ProvidersRepository()
    var isFetchOk: Bool?
    var providers : [Provider] = []
    weak var view : ProviderSelectorViewProtocol?
    
    init(view: ProviderSelectorViewProtocol?) {
        self.view = view
    }
    
}

extension ProviderSelectorPresenter: SelectorPresentProtocol {
    func fetchData() {
        repository.getProviders(categoryId: 1) { (isFetchOk, providers, error) in
            self.isFetchOk = isFetchOk
            self.providers = providers
            
            self.view?.show(providers: providers)
            
        }
        
    }
    
    func elementSelected(at index: Int) {
        let selectedProvider = providers[index]
        print(selectedProvider.name ?? "")
    }
    
    
}
