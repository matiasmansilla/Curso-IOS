//
//  LoginWireframe.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 03/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

class LoginWireframe {
    
    static func navigateToLogin(from context: UIViewController) {   //from context es para obtener su navigationController
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: .main)
        let loginVC = storyboard.instantiateViewController(identifier: "LoginViewController") as LoginViewController
        
        let loginPresenter = LoginPresenter(view: loginVC)  //instanciamos un presenter y le pasamos la vista
        loginVC.presenter = loginPresenter                  //le enchufamos el presenter a la vista
        context.navigationController?.setViewControllers([loginVC], animated: true)
            
    }
}
 
