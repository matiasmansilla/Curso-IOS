//
//  LoginViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 25/04/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let repository = AuthRepository()
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginTapped(_ sender: Any) {
//        if let username = userTextField?.text, let password = passwordTextField?.text{
//            repositiry.login(username: username, password: password, completion: { user in
//                print(user?.name ?? nil)
//                print(user?.token ?? nil)
//            })
//        }
        if let username = userTextField?.text, let password = passwordTextField?.text {
            print(username)
            print(password)
            
            repository.login(username: username, password: password, completion: { user in
                print(user?.name)
                print(user?.token)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
