//
//  ColorPalette.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func myWhite() -> UIColor {
        return UIColor.whiteColor()
    }
    
    static func deepSkyBlue() -> UIColor {
        return UIColor(red:0, green:0.69, blue:0.98, alpha:1)
    }
    
    static func deepSkyBlueLight() -> UIColor {
        return UIColor(red:0, green:0.76, blue:0.99, alpha:1)
    }
    
    static func iris() -> UIColor {
        return UIColor(red:0.3, green:0.3, blue:0.82, alpha:1)
    }
    
    static func irisLight() -> UIColor {
        return UIColor(red:0.35, green:0.34, blue:0.89, alpha:1)
    }
    
    static func emerald() -> UIColor {
        return UIColor(red:0.26, green:0.83, blue:0.35, alpha:1)
    }
    
    static func emeraldLight() -> UIColor {
        return UIColor(red:0.38, green:0.82, blue:0.45, alpha:1)
    }
    
    static func scarlet() -> UIColor {
        return UIColor(red:1, green:0.15, blue:0.29, alpha:1)
    }
    
    static func scarletLight() -> UIColor {
        return UIColor(red:1, green:0.18, blue:0.36, alpha:1)
    }
    
    static func california() -> UIColor {
        return UIColor(red:1, green:0.54, blue:0.03, alpha:1)
    }
    
    static func californiaLight() -> UIColor {
        return UIColor(red:1, green:0.62, blue:0.03, alpha:1)
    }
    
    static func azure() -> UIColor {
        return UIColor(red:0, green:0.44, blue:1, alpha:1)
    }
    
    static func azureLight() -> UIColor {
        return UIColor(red:0.01, green:0.51, blue:1, alpha:1)
    }
    
    static func orient() -> UIColor {
        return UIColor(red:0.03, green:0.35, blue:0.49, alpha:1)
    }
    
    static func orientLight() -> UIColor {
        return UIColor(red:0.02, green:0.38, blue:0.48, alpha:1)
    }
    
    
    // WWDC15 palette
    static func WWDCprimary(index:Int) -> UIColor {
        switch index {
        case 6:
            return UIColor(red:1, green:0.5, blue:0.84, alpha:1)
        case 7:
            return UIColor(red:0.99, green:0.37, blue:0.43, alpha:1)
        case 0:
            return UIColor(red:1, green:0.53, blue:0.43, alpha:1)
        case 1:
            return UIColor(red:0.98, green:0.75, blue:0.37, alpha:1)
        case 2:
            return UIColor(red:0.36, green:0.9, blue:0.84, alpha:1)
        case 3:
            return UIColor(red:0.19, green:0.49, blue:0.99, alpha:1)
        case 4:
            return UIColor(red:0.57, green:0.31, blue:0.96, alpha:1)
        case 5:
            return UIColor(red:0.84, green:0.35, blue:0.92, alpha:1)
        default:
            return UIColor.blackColor()
        }
    }
    
    static func WWDCsecondary(index:Int) -> UIColor {
        return UIColor.newWWDCtertiary(index).darkerColor(0.2)
    }
    
    static func WWDCtertiary(index:Int) -> UIColor {
        return UIColor.newWWDCtertiary(index).darkerColor(0.3)
    }
    
    
    static func newWWDCtertiary(index:Int) -> UIColor {
        switch index%8 {
        case 0:
            return UIColor(red:1, green:0.88, blue:0.04, alpha:1)
        case 1:
            return UIColor(red:0.76, green:0.84, blue:0.23, alpha:1)
        case 2:
            return UIColor(red:0.36, green:0.73, blue:0.46, alpha:1)
        case 3:
            return UIColor(red:0.36, green:0.69, blue:0.89, alpha:1)
        case 4:
            return UIColor(red:0.54, green:0.52, blue:0.8, alpha:1)
        case 5:
            return UIColor(red:0.78, green:0.51, blue:0.71, alpha:1)
        case 6:
            return UIColor(red:0.94, green:0.33, blue:0.38, alpha:1)
        case 7:
            return UIColor(red:0.96, green:0.55, blue:0.22, alpha:1)
        default:
            return UIColor.blackColor()
        }
    }
    
    
    static func darkerBlue() -> UIColor {
        return UIColor(red:0.07, green:0.09, blue:0.19, alpha:1)
    }

    static func darkBlue() -> UIColor {
        return UIColor(red:0.05, green:0.1, blue:0.49, alpha:1)
    }
    static func personBlue() ->UIColor {
        return UIColor(red:0.78, green:0.78, blue:0.78, alpha:1)
    }
}

