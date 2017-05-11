//
//  SampleTableViewCell.swift
//  SampleRotatedView
//
//  Created by Efthimis Liapatis on 10/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import UIKit

enum ColorSet {
    case first, second
}

class SampleTableViewCell: UITableViewCell {
    @IBOutlet var sampleImageView: UIImageView!
    
    static var identifier = "sampleCellIdentifier"

    func configureCell(forIndex index: Int, colorSet: ColorSet) {
        switch index {
        case 0:
            backgroundColor = (colorSet == .first) ? SampleColor.green.light : SampleColor.yellow.light
            sampleImageView.image = Assets.rocket.withRenderingMode(.alwaysTemplate)
            break
        case 1:
            backgroundColor = (colorSet == .first) ? SampleColor.green.faint : SampleColor.red.faint
            sampleImageView.image = Assets.fly.withRenderingMode(.alwaysTemplate)
            break
        case 2:
            backgroundColor = (colorSet == .first) ? SampleColor.blue.light : SampleColor.red.light
            sampleImageView.image = Assets.search.withRenderingMode(.alwaysTemplate)
            break
        default:
            backgroundColor = (colorSet == .first) ? SampleColor.blue.dark : SampleColor.red.extraLight
            sampleImageView.image = Assets.rocket.withRenderingMode(.alwaysTemplate)
            break
        }
        
        sampleImageView.tintColor = .white
        
        selectionStyle = .none
        
    }
}
