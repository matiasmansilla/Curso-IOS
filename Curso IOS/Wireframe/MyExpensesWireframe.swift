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
        context.navigationController?.setViewControllers([myExpensesVC], animated: true)
        
    }
}
