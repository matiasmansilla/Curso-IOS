//
//  CategorySelectorPresenter.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation

protocol  CategorySelectorDelegate: class {
    func categorytWasSelected(_ category: Category)
}

protocol CategorySelectorViewProtocol: class {
    func show(categories: [Category])
}

class CategorySelectorPresenter {
    
    var delegate : CategorySelectorDelegate?
    let repository = CategoriesRepository()
    var isFetchOk: Bool?
    var categories : [Category] = []
    weak var view : CategorySelectorViewProtocol?
    
    init(view: CategorySelectorViewProtocol?) {
        self.view = view
    }
    
}

extension CategorySelectorPresenter: SelectorPresentProtocol {
    func fetchData() {
        repository.getCategories { (isFetchOk, categories, error) in
            self.isFetchOk? = isFetchOk
            self.categories = categories
            
            self.view?.show(categories: categories)
            
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedCategory = categories[index]
        delegate?.categorytWasSelected(selectedCategory)
    }
    
    
}
