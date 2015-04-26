//
//  ExtraInfo.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 26/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import Foundation
import CoreData

@objc(ExtraInfo)
class ExtraInfo: NSManagedObject {

    @NSManaged var about: String
    @NSManaged var iconName: String
    @NSManaged var name: String
    @NSManaged var segueID: String
    @NSManaged var from: Person

}
