//
//  MyExpensesViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 08/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

protocol MyExpensePresenterProtocol: class {
    func fetchdata()
    func elementSelected(at index: Int)
    func newExpenseTapped()
    func logout()
    
}

class MyExpensesViewController: UIViewController {
    
    var elements = [[String: String]]()
    var presenter: MyExpensePresenterProtocol?
    
    @IBOutlet private var tableView: UITableView?
    @IBOutlet private var helloUserLabel: UILabel?
    
    @IBAction func newExpenseTapped(_ sender: Any) {
        presenter?.newExpenseTapped()
    }
    
    @objc func logoutTapped(){
        presenter?.logout()
    }
    override func viewDidLoad() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))

        tableView?.rowHeight = 100

        tableView?.register(UINib(nibName:"MyExpenseTableViewCell", bundle: .main),forCellReuseIdentifier: "cell")
        tableView?.dataSource = self
        tableView?.delegate = self
  
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchdata()
    }
}

extension MyExpensesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyExpenseTableViewCell {
            cell.setAmountLabel(text: "$\(elements[row]["amount"] ?? "")")
            cell.setAccountNameLabel(text: elements[row]["accountName"] ?? "")
            cell.setCreatedAtDateLabel(text: elements[row]["createdAtDate"] ?? "")
            cell.setcategoryNameLabel(text: elements[row]["categoryName"] ?? "")
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

//metodo que me devuleve que elemento de la tabla que se selecciono, en indexPath
extension MyExpensesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        presenter?.elementSelected(at: row)
        
        
    }
}

extension MyExpensesViewController: MyExpenseViewProtocol{
    func navigateToHomescreen() {
        MainWireframe.navigateToHomeScreen(from: self)
    }
    
    func navigateToMyExpenseDetail() {
        MyExpensesWireframe.navigateToMyExpenseDetail(from: self)
    }
    
    func showMyExpenses(myExpenses: [MyExpense]) {
        let arrayDict = myExpenses.map { (myExpense) -> [String:String] in
            var expenseData : [String : String] = ["amount" : "", "accountName" : "", "categoryName" : "", "createdAtDate" : "" ]
            expenseData["amount"] = String(myExpense.amount ?? 0.0)
            expenseData["accountName"] = myExpense.account?.name
            expenseData["categoryName"] = myExpense.category?.name
            
            let input = myExpense.createdAt
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            if let date = formatter.date(from: input!){
    
                let displayFormatter = DateFormatter()
                displayFormatter.locale = Locale(identifier: "es_AR")
                displayFormatter.dateStyle = .full
                expenseData["createdAtDate"] = displayFormatter.string(from: date)
                //print(displayFormatter.string(from: date))
            }
            
            return expenseData
        }
        elements = arrayDict
        tableView?.reloadData()
        
        helloUserLabel?.text = String("¡Hola \(myExpenses[0].user?.name ?? "") !")
    }
    
    func navigateToNewExpense() {
    ExpensesWireframe.navigateToNewExpense(from: self)
    }
    
    
}

