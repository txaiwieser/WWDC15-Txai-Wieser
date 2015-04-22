//
//  Int+Extensions.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 15/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation

extension Int {
    public static func random(#min: Int, max: Int) -> Int {
        assert(min < max)
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
}