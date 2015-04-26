//
//  CGSize+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import CoreGraphics


extension CGSize {
    
    func center() -> CGPoint {
        return CGPoint(x: self.width/2, y: self.height/2)
    }
    
    func radius() -> CGFloat {
        return min(self.width/2, self.height/2)
    }
    
}

public func * (size: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: size.width * value, height: size.height * value)
}

public func * (size1: CGSize, size2: CGSize) -> CGSize {
    return CGSize(width: size1.width * size2.width, height: size1.height * size2.height)
}

public func / (size: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: size.width / value, height: size.height / value)
}

public func + (size: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: size.width + value, height: size.height + value)
}

public func - (size: CGSize, value: CGFloat) -> CGSize {
    return CGSize(width: size.width - value, height: size.height - value)
}

public func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width - right.width, height: left.height - right.height)
}

public func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width + right.width, height: left.height + right.height)
}