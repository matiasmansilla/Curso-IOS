//
//  SelectorWireframe.swift
//  Curso IOS
//
//  Created by Dardo Matias Mansilla on 07/05/2020.
//  Copyright © 2020 Dardo Matias Mansilla. All rights reserved.
//

import Foundation
import UIKit

class SelectorWireframe {
    
    static func navigateToAccountSelector(from context: UIViewController){
        let storyboard = UIStoryboard(name: "SelectorViewController", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "SelectorViewController") as SelectorViewController
        
        let presenter = AccountSelectorPresenter(view: vc)
        vc.presenter = presenter
       context.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    static func navigateToCategorySelector(from context: UIViewController){
        let storyboard = UIStoryboard(name: "SelectorViewController", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "SelectorViewController") as SelectorViewController
        
        let presenter = CategorySelectorPresenter(view: vc)
        vc.presenter = presenter
        context.navigationController?.pushViewController(vc, animated: true)
        
    }
    static func navigateToProviderSelector(from context: UIViewController){
        let storyboard = UIStoryboard(name: "SelectorViewController", bundle: .main)
        let vc = storyboard.instantiateViewController(identifier: "SelectorViewController") as SelectorViewController
        
        let presenter = ProviderSelectorPresenter(view: vc)
        vc.presenter = presenter
        context.navigationController?.pushViewController(vc, animated: true)
        
    }
}
