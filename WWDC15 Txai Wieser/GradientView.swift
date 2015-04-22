//
//  GradientView.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func prepareForInterfaceBuilder() {
        self.backgroundColor = UIColor.blackColor()
    }
//    override func drawRect(rect: CGRect) {
//
//        let context = UIGraphicsGetCurrentContext()
//        let startColor = UIColor(red:0.141, green:0.741, blue:0.921, alpha:1).colorWithAlphaComponent(0.2)
//        let endColor = UIColor(red:0.141, green:0.741, blue:0.921, alpha:1)
//        let colors = [startColor.CGColor, endColor.CGColor]
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let colorLocations:[CGFloat] = [0.0, 1.0]
//        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
//        var startPoint = CGPointZero
//        var endPoint = CGPoint(x:0.0, y:self.bounds.height)
//        let center = CGPoint(x: CGRectGetMidX(rect), y: CGRectGetMidY(rect))
//        let radius = sqrt(pow(self.bounds.width/2, 2)+pow(self.bounds.height/2, 2))*1
//        CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, 0)
//    }
}
