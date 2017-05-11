//
//  Radiansable.swift
//  ELRotatedMenu
//
//  Created by Efthimis Liapatis on 08/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import Foundation

protocol Trigonometricable {
    
    /// Get the radians from an angle in degrees
    ///
    /// - Returns: the angle in radians
    func toRadians() -> CGFloat
    
    /// Get the degrees from an angle in radians
    ///
    /// - Returns: the angle in degrees
    func toDegrees() -> CGFloat
    
    /// Get the angle between the screen height and screen diagonal
    ///
    /// - Returns: the angle in degrees
    static func angleOfScreenDiagonal() -> CGFloat
}

extension CGFloat: Trigonometricable {
    func toRadians() -> CGFloat {
        return self * .pi / 180
    }
    
    func toDegrees() -> CGFloat {
        return self * 180 / .pi
    }
    static func angleOfScreenDiagonal() -> CGFloat {
        return CGFloat(-atan(Double(UIScreen.main.bounds.width/UIScreen.main.bounds.height))).toDegrees()
    }
}
