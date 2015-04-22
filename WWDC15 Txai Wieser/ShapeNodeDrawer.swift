//
//  DrawManager.swift
//  OngoingVeins_SecondTest
//
//  Created by Txai Wieser on 02/08/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

import SpriteKit

class ShapeNodeDrawer: SKShapeNode {
    var lastPoint:CGPoint!
    var i:CGFloat = 0;
    let drawOnlyAPoint = false
    
    init(myTest:NSString) {
        super.init()
        let node = SKSpriteNode(color: UIColor.yellowColor(), size: CGSizeMake(10, 10))
        node.alpha = 1
        //addChild(node)

    }
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    func lineTo(point:CGPoint) {
        
        if drawOnlyAPoint {
            strokeColor = UIColor(hue: i, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            i = i+0.01;
            if i>=1 {
                i=0
            }
        }
        else {
            if let p = lastPoint {
                let bPath = CGPathCreateMutableCopy(self.path)
                CGPathMoveToPoint(bPath, nil, p.x, p.y)
                CGPathAddLineToPoint(bPath, nil, point.x, point.y)
                self.path = bPath
            } else {
                let aPath = CGPathCreateMutable()
                CGPathMoveToPoint(aPath, nil, 0, 0)
                //CGPathAddLineToPoint(aPath, nil, point.x, point.y)
                self.path = aPath
            }
            lastPoint = point
        }
    }
    
    func lineStyle(thickness: Float, color: UIColor) {
        lineWidth = CGFloat(thickness)
        lineCap = kCGLineCapRound
        lineJoin = kCGLineJoinRound
        strokeColor = color
    }
}


