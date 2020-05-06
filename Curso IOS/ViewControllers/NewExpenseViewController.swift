//
//  NewExpenseViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 06/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

protocol NewExpensePresenterProtocol: class {
    func logout()

}
class NewExpenseViewController : UIViewController {
    
    var presenter: NewExpensePresenterProtocol?
    
    @IBAction func LogoutTapped(_ sender: Any) {
        presenter?.logout()
        MainWireframe.navigateToHomeScreen(from: self)
    }
    

}

extension NewExpenseViewController: NewExpenseViewProtocol {    //implementacion del protocolo de la vista
    
}
