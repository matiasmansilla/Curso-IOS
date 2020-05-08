//
//  MyExpensesViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

protocol MyExpensePresenterProtocol: class {
    func newExpenseTapped()
}

class MyExpensesViewController: UIViewController {
    
    var presenter: MyExpensePresenterProtocol?
    @IBAction func newExpenseTapped(_ sender: Any) {
        presenter?.newExpenseTapped()
    }
    
    
}

extension MyExpensesViewController: MyExpenseViewProtocol{
    func navigateToNewExpense() {
    ExpensesWireframe.navigateToNewExpense(from: self)
    }
    
    
}
