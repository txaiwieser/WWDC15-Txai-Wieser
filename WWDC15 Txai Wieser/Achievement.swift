//
//  Achievement.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 26/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
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
