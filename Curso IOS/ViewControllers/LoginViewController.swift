//
//  LoginViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 25/04/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol {
    func login(username: String, password : String)
}

class LoginViewController: UIViewController {
    
    var presenter : LoginPresenterProtocol?
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginTapped(_ sender: Any) {

        
        if let username = userTextField?.text, let password = passwordTextField?.text {
            presenter?.login(username: username, password: password)
          
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension LoginViewController: LoginViewProtocol{
    func show(error: String) {
        let alert = UIAlertController(title: "", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showLoginSucess() {
        MainWireframe.navigateToHomeScreen(from: self)
    }
    
    
}
