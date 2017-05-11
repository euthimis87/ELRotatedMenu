//
//  SampleColor.swift
//  SampleRotatedView
//
//  Created by Efthimis Liapatis on 10/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import UIKit

struct SampleColor {
    enum red {
        static var light = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        static var dark = UIColor(red: 192.0/255.0, green: 57.0/255.0, blue: 43.0/255.0, alpha: 1.0)
        static var faint = UIColor(red: 230.0/255.0, green: 126.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        static var extraLight = UIColor(red: 217.0/255.0, green: 84.0/255.0, blue: 89.0/255.0, alpha: 1.0)
    }
    enum blue {
        static var light = UIColor(red: 53.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1.0)
        static var dark = UIColor(red: 36.0/255.0, green: 107.0/255.0, blue: 156.0/255.0, alpha: 1.0)
    }
    
    enum yellow {
        static var light = UIColor(red: 254.0/255.0, green: 205.0/255.0, blue: 2.0/255.0, alpha: 1.0)
        static var dark = UIColor(red: 197.0/255.0, green: 130.0/255.0, blue: 4.0/255.0, alpha: 1.0)
    }
    
    enum green {
        static var light = UIColor(red: 45.0/255.0, green: 204.0/255.0, blue: 113.0/255.0, alpha: 1.0)
        static var dark = UIColor(red: 39.0/255.0, green: 174.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        static var faint = UIColor(red: 26.0/255.0, green: 188.0/255.0, blue: 156.0/255.0, alpha: 1.0)
    }
}
