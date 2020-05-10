//
//  ExpenseDetailViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 09/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

protocol ExpenseDetailPreseterProtocol: class {
    func setData()
}

class ExpenseDetailViewController: UIViewController {
    
    @IBOutlet weak var createdAtDateLabel: UILabel!
    @IBOutlet weak var createdAtTimeLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var providerNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    
    
    var presenter: ExpenseDetailPreseterProtocol?
    var myExpense: MyExpense?
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.setData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

extension ExpenseDetailViewController: ExpenseDetailViewProtocol {
    func showExpenseDetail(myExpense: MyExpense) {
        self.accountNameLabel.text = myExpense.account?.name
        self.createdAtDateLabel.text = myExpense.createdAt
        self.currencyLabel.text = myExpense.account?.currency?.symbol
        self.categoryNameLabel.text = myExpense.category?.name
        self.providerNameLabel.text = myExpense.provider?.name
        self.amountLabel.text = String("$ \(myExpense.amount ?? 0.0)")
        self.quantityLabel.text = String("Cantidad: \(myExpense.numberOfItems ?? 0)")
        self.descriptionText.text = myExpense.description
        
    }
    
}


