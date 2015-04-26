//
//  Event.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 26/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import Foundation
import CoreData

@objc(Event)
class Event: NSManagedObject {

    @NSManaged var iconName: String
    @NSManaged var longDescription1: String?
    @NSManaged var longDescription2: String?
    @NSManaged var longDescription3: String?
    @NSManaged var name: String?
    @NSManaged var smallDescription: String?
    @NSManaged var from: Person

}
