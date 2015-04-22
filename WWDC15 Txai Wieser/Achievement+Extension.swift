//
//  Achievement+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 14/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import CoreData


extension Achievement {
    static func newInstance() -> Achievement {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "Achievement"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Achievement
    }
}