//
//  ViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 25/04/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func loginTaped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        navigationController?.pushViewController(loginVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

