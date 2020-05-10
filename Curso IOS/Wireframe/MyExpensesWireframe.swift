//
//  MyExpensesWireframe.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

class MyExpensesWireframe {
    
    static func navigateToMyExpenses(from context: UIViewController) {
        let storyboard = UIStoryboard(name: "MyExpensesViewController", bundle: .main)
        let myExpensesVC = storyboard.instantiateViewController(identifier: "MyExpensesViewController") as MyExpensesViewController
        
        let presenter = MyExpensePresenter(view: myExpensesVC)
        
        myExpensesVC.presenter = presenter
        myExpensesVC.title = "Mis gastos"
        context.navigationController?.setViewControllers([myExpensesVC], animated: true)
        
    }
    
    static func navigateToMyExpenseDetail(from context: UIViewController) {
        let storyboard = UIStoryboard(name: "ExpenseDetailViewController", bundle: .main)
        let myExpenseDetailVC = storyboard.instantiateViewController(identifier: "ExpenseDetailViewController") as ExpenseDetailViewController
        let presenter = ExpenseDetailPresenter(view: myExpenseDetailVC)
//        presenter.delegate = delegate
        myExpenseDetailVC.presenter = presenter
        context.navigationController?.pushViewController(myExpenseDetailVC, animated: true)
    }

}
