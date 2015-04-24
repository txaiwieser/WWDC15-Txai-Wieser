//
//  GradientView.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIImageView {

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
        self.contentMode = UIViewContentMode.ScaleAspectFill
        self.image = UIImage(named: "background")
    }
//    override func drawRect(rect: CGRect) {
//
//        let ctx = UIGraphicsGetCurrentContext()
//        let c1 = UIColor.redColor()
//        let c2 = UIColor.yellowColor()
//        let c3 = UIColor.blackColor()
//        let c4 = UIColor.greenColor()
//        let colors = [c1, c2, c3, c4]
//        let colorLocations:[CGFloat] = [0.0, 0.3, 0.6, 1.0]
//        
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
//
//        let center = CGPoint(x: CGRectGetMidX(rect), y: CGRectGetMidY(rect))
//        let radius = sqrt(pow(self.bounds.width/2, 2)+pow(self.bounds.height/2, 2))*1
//        CGContextDrawRadialGradient(ctx, gradient, center, 0, center, radius, 0)
//        
//        
//        
//        float dim = MIN(self.bounds.size.width, self.bounds.size.height);
//        float r=dim/4;
//        float R=dim/2;
//        
//        float halfinteriorPerim = M_PI*r;
//        float halfexteriorPerim = M_PI*R;
//        float smallBase= halfinteriorPerim/subdiv;
//        float largeBase= halfexteriorPerim/subdiv;
//        
//        let cell = UIBezierPath()
//        
//        [cell moveToPoint:NSMakePoint(- smallBase/2, r)];
//        [cell lineToPoint:NSMakePoint(+ smallBase/2, r)];
//        
//        [cell lineToPoint:NSMakePoint( largeBase /2 , R)];
//        [cell lineToPoint:NSMakePoint(-largeBase /2,  R)];
//        [cell closePath];
//        
//        CGContextTranslateCTM(ctx, +self.bounds.size.width/2, +self.bounds.size.height/2);
//        
//        let incr = CGFloat(M_PI)/CGFloat(colors.count)
//        CGContextScaleCTM(ctx, 0.9, 0.9);
//        CGContextRotateCTM(ctx, CGFloat(M_PI/2));
//        CGContextRotateCTM(ctx,-incr/2);
//        
//        for color in colors {
//            color.set()
//            cell.fill()
//            cell.stroke()
//            CGContextRotateCTM(ctx, -incr);
//        }
//        
//        
//    }
}

