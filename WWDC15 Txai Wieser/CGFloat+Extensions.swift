//
//  CGSize+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import CoreGraphics


extension CGFloat {
    
    var PI:CGFloat { get { return CGFloat(M_PI) } }
    
    public func degreesToRadians() -> CGFloat {
        return PI * self / 180.0
    }
    
    public func radiansToDegrees() -> CGFloat {
        return self * 180.0 / PI
    }
    
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    public static func random(#min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}