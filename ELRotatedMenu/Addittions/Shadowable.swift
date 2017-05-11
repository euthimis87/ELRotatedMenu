//
//  Shadowable.swift
//  ELRotatedMenu
//
//  Created by Efthimis Liapatis on 08/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import Foundation

protocol Shadowable: class {
    func addShadow(shadowColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize)
}

extension Shadowable where Self: UIView {
    func addShadow(shadowColor: UIColor = UIColor.black, shadowOpacity: Float = 0.3, shadowRadius: CGFloat = 10, shadowOffset: CGSize = CGSize(width: -2, height: 2)) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
    }
}

extension UIView: Shadowable {}
