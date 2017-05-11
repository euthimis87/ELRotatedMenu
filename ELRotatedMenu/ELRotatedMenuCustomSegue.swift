//
//  ELRotatedMenuELRotatedMenuCustomSegueSegue.swift
//  ELRotatedMenu
//
//  Created by Efthimis Liapatis on 05/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import UIKit

public  enum SegueIdentifierType {
    case menu
    case main
    
    var id: String {
        switch self {
        case .menu:
            return "el_menu"
        case .main:
            return "el_front"
        }
    }
}

public class ELRotatedMenuSegue: UIStoryboardSegue {
 
    override public func perform() {
        guard let identifier = self.identifier else {
            return
        }
        
        guard let elRotatedMenu = self.source as? ELRotatedMenu else {
            return
        }
        
        switch identifier {
        case SegueIdentifierType.menu.id:
            elRotatedMenu.setContainerView(SegueIdentifierType.menu, withViewController: self.destination)
            break
        case SegueIdentifierType.main.id:
            elRotatedMenu.setContainerView(SegueIdentifierType.main, withViewController: self.destination)
            break
        default:
            break
        }
        
    }
}
