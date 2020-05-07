//
//  SelectorViewController.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

protocol SelectorPresentProtocol: class {
    func fetchData()
    func elementSelected(at index: Int)
}

class SelectorViewController: UIViewController {
    
    @IBOutlet private var tableview: UITableView?
    var elements: [String] = []
    var presenter : SelectorPresentProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //asi registro la celda especifica en esta tabla con el identificador "cell"
        tableview?.register(UINib(nibName: "SelectorTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
        
        //MUCHO MUY IMPORTANTE(le digo quien es su dataSource y su delegate)
        tableview?.dataSource = self
        tableview?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData()
            
    }
}
//para funcionar como data source la clase debe conformar el protocolo UITableViewDataSource
extension SelectorViewController: UITableViewDataSource {
    //return rows to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row     // tenemos solo una section(x eso la ignoramos)
        //recupere cell de id "cell" y le seteamos un texto
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SelectorTableViewCell{
            cell.set(text: elements[row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
//para notificar que fila toco, debo conformar protocolo UITableViewDelegate
extension SelectorViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        presenter?.elementSelected(at: row)
    }
}

extension SelectorViewController: AccountSelectorViewProtocol{
    //convierto [Account] en [String] porque la tabla necesita [String]
    func show(accounts: [Account]) {
        let names = accounts.map { (account) -> String in
            return (account.name ?? "") + "-" + (account.currency?.symbol ?? "")
            
        }
        elements = names
        tableview?.reloadData()

    }
    
    
}
