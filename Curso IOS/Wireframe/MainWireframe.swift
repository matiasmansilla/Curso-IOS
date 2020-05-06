//
//  MainWireframe.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 05/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

class MainWireframe {
    
    static func navigateToHomeScreen(from context: UIViewController){
        let user = SessionHelper().getUser()
        if user != nil{
            ExpensesWireframe.navigateToNewExpense(from: context)
        } else {
            LoginWireframe.navigateToLogin(from: context)
        }
    }
}
