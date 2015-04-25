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
        initialize()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
        initialize()
    }
    func initialize() {
        self.backgroundColor = UIColor.whiteColor()
//        self.contentMode = UIViewContentMode.ScaleAspectFill
//        self.image = UIImage(named: "background")
    }
//    override func drawRect(rect: CGRect) {
//        
//        let context = UIGraphicsGetCurrentContext()
//        let startColor = UIColor.whiteColor()
//        let endColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.08)
//        let colors = [startColor.CGColor, endColor.CGColor]
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let colorLocations:[CGFloat] = [0.0, 1.0]
//        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
//        var startPoint = CGPointZero
//        var endPoint = CGPoint(x:0.0, y:self.bounds.height)
//        let center = CGPoint(x: CGRectGetMidX(rect), y: CGRectGetMidY(rect))
//        let radius = sqrt(pow(self.bounds.width/2, 2)+pow(self.bounds.height/2, 2))*1
//        CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, 0)
//        
//    }
}

