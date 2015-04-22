//
//  ScreenInfo.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

@objc(ScreenInfo)
class ScreenInfo: NSManagedObject {

    @NSManaged var text: String
    @NSManaged var iconName: String
    @NSManaged var order: Int16
    @NSManaged var images: NSSet

}
