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
    func accountTapped()
    func categoryTapped()
    func providerTapped()
    func createTapped()

}
class NewExpenseViewController : UIViewController {
    
    var presenter: NewExpensePresenterProtocol?
    
    @IBOutlet weak var accountContainer: UIView!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var categoryContainer: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var providerContainer: UIView!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var montoTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBAction func createTapped(_ sender: Any) {
        presenter?.createTapped()
    }
    
    @IBAction func LogoutTapped(_ sender: Any) {
        presenter?.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI(){
        accountContainer?.layer.borderWidth = 1
        accountContainer?.layer.borderColor = UIColor.lightGray.cgColor
        accountContainer?.layer.cornerRadius = 8
        
        categoryContainer?.layer.borderWidth = 1
        categoryContainer?.layer.borderColor = UIColor.lightGray.cgColor
        categoryContainer?.layer.cornerRadius = 8
        
        providerContainer?.layer.borderWidth = 1
        providerContainer?.layer.borderColor = UIColor.lightGray.cgColor
        providerContainer?.layer.cornerRadius = 8
    
        montoTextField?.layer.borderWidth = 1
        montoTextField?.layer.borderColor = UIColor.lightGray.cgColor
        montoTextField?.layer.cornerRadius = 8
        
        descriptionTextField?.layer.borderWidth = 1
        descriptionTextField?.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextField?.layer.cornerRadius = 8
        
        quantityTextField?.layer.borderWidth = 1
        quantityTextField?.layer.borderColor = UIColor.lightGray.cgColor
        quantityTextField?.layer.cornerRadius = 8
        
        //asi creo gesture sobre una view (no un boton), # es x seleccionde de funcion
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(accountSelectorTapped))
        accountContainer?.addGestureRecognizer(gesture1)
        accountContainer?.isUserInteractionEnabled = true
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(categorySelectorTapped))
        categoryContainer?.addGestureRecognizer(gesture2)
        categoryContainer?.isUserInteractionEnabled = true
        
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(providertSelectorTapped))
        providerContainer?.addGestureRecognizer(gesture3)
        providerContainer?.isUserInteractionEnabled = true
    }
    
    @objc private func accountSelectorTapped(){
        //print("accounttapped")
        presenter?.accountTapped()
    }
    @objc private func categorySelectorTapped(){
        presenter?.categoryTapped()
    }
    @objc private func providertSelectorTapped(){
        presenter?.providerTapped()
    }
}

extension NewExpenseViewController: NewExpenseViewProtocol {
    
    func navigateToHomescreen() {
        MainWireframe.navigateToHomeScreen(from: self)
    }
    
    func navigateToAccountSelector() {
        SelectorWireframe.navigateToAccountSelector(from: self)
    }
    
    func navigateToCategorySelector() {
        SelectorWireframe.navigateToCategorySelector(from: self)

    }
    
    func navigateToProviderSelector() {
        SelectorWireframe.navigateToProviderSelector(from: self)

    }
    //implementacion del protocolo de la vista
    
}
