//
//  ScreenInfo.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 26/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import Foundation
import CoreData

@objc(ScreenInfo)
class ScreenInfo: NSManagedObject {

    @NSManaged var iconName: String
    @NSManaged var order: Int16
    @NSManaged var text: String
    @NSManaged var images: NSSet
    @NSManaged var from: Person

}
