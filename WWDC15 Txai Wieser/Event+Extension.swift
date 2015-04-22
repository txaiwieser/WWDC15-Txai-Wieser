//
//  Event+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 20/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import CoreData

extension Event {
    static func newInstance() -> Event {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "Event"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Event
    }
}