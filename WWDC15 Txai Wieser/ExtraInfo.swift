//
//  ExtraInfo.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 21/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

@objc(ExtraInfo)
class ExtraInfo: NSManagedObject {

    @NSManaged var iconName: String
    @NSManaged var segueID: String
    @NSManaged var name: String

}
