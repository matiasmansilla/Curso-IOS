//
//  Extensions.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 26/04/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit
extension UIButton{
    
    func roundButton(radius: Int) {
        layer.cornerRadius = bounds.height/CGFloat(radius)  //redondea un determinado layer segun el "radius"
        clipsToBounds = true
    }
}
