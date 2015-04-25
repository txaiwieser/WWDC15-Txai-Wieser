//
//  UIColor+Extension.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 24/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import UIKit

extension UIColor {
    
    func darkerColor(value:CGFloat?) -> UIColor {
        var c = (value == nil ? 0.2 : value!)
        var r = CGFloat(0), g = CGFloat(0), b = CGFloat(0), a = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: max(r - c, 0), green: max(g - c, 0), blue: max(b - c, 0), alpha: a)
    }
}