//
//  Event.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 20/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

@objc(Event)
class Event: NSManagedObject {

    @NSManaged var longDescription1: String?
    @NSManaged var name: String?
    @NSManaged var smallDescription: String?
    @NSManaged var iconName: String
    @NSManaged var longDescription2: String?
    @NSManaged var longDescription3: String?
    @NSManaged var from: Person

}
