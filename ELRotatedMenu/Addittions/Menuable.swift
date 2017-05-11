//
//  Menuable.swift
//  ELRotatedMenu
//
//  Created by Efthimis Liapatis on 05/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import UIKit

public protocol Menuable: class {
    var menuViewController: ELRotatedMenu? { get }
}

extension Menuable where Self: UIViewController {
   public var menuViewController: ELRotatedMenu? {
        get {
            return parentViewController(self.parent) as? ELRotatedMenu
        }
    }
    
    fileprivate func parentViewController(_ viewController: UIViewController?) -> UIViewController? {
        guard let parentVC = viewController else {
            return nil
        }
        
        if parentVC is ELRotatedMenu {
            return parentVC
        }
        
        return parentViewController(parentVC)
    }
}

extension UIViewController: Menuable {}
