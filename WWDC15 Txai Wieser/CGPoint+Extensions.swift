//
//  CGSize+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import CoreGraphics


extension CGPoint {
    
    public init(angle: CGFloat) {
        self.init(x: cos(angle), y: sin(angle))
    }
    public init(size: CGSize) {
        self.init(x: size.width, y: size.height)
    }
    mutating func offset(#dx: CGFloat, dy: CGFloat) -> CGPoint {
        x += dx
        y += dy
        return self
    }
    
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        let len = length()
        return len>0 ? self / len : CGPoint.zeroPoint
    }
    
    func distanceTo(point: CGPoint) -> CGFloat {
        return (self - point).length()
    }
    
    var angle: CGFloat {
        return atan2(y, x)
    }
}


public func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

public func * (point: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * value, y: point.y * value)
}

public func * (point1: CGPoint, point2: CGPoint) -> CGPoint {
    return CGPoint(x: point1.x * point2.x, y: point1.y * point2.y)
}
public func / (point: CGPoint, value: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / value, y: point.y / value)
}

public func + (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x + right.width, y: left.y + right.height)
}

public func - (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x - right.width, y: left.y - right.height)
}
