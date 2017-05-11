//
//  Rotatable.swift
//  ELRotatedMenu
//
//  Created by Efthimis Liapatis on 08/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import Foundation

protocol Rotatable {
    func rotate(aroundPoint point: CGPoint, withAngle angle: CGFloat)
}

extension Rotatable where Self: UIView {
    func rotate(aroundPoint point: CGPoint, withAngle angle: CGFloat) {
        self.transform = CGAffineTransform(a: cos(angle),b: sin(angle),c: -sin(angle),d: cos(angle),tx: point.x-point.x*cos(angle)+point.y*sin(angle),ty: point.y-point.x*sin(angle)-point.y*cos(angle))
    }
}

extension UIView: Rotatable {}
