//
//  Achievement.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

@objc(Achievement)
class Achievement: NSManagedObject {

    @NSManaged var iconName: String
    @NSManaged var longDescription: String
    @NSManaged var name: String
    @NSManaged var from: Person

}
