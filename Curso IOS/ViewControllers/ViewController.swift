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
        LoginWireframe.navigateToLogin(from: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

