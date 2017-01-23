//
//  FancyView.swift
//  ZaimaSocial
//
//  Created by Ahmed Zaima on 23/01/2017.
//  Copyright © 2017 Ahmed Zaima. All rights reserved.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }

}
