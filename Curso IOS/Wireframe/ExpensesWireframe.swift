//
//  ExpensesWireframe.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 06/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

class ExpensesWireframe {
    
    static func navigateToNewExpense(from context: UIViewController) {
        let storyboard = UIStoryboard(name: "NewExpenseViewController", bundle: .main)
        let newExpenseVC = storyboard.instantiateViewController(identifier: "NewExpenseViewController") as NewExpenseViewController
        let presenter = NewExpensePresenter(view: newExpenseVC)
        newExpenseVC.presenter = presenter
        
        context.navigationController?.setViewControllers([newExpenseVC], animated: true)
        
    }
}
