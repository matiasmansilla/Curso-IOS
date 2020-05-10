//
//  SelectorTableViewCell.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

class SelectorTableViewCell: UITableViewCell{
    
    
    @IBOutlet private var labelCell:UILabel?
    
    func set(text: String){
        labelCell?.text = text
    }
}
