//
//  ScreenInfo+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import CoreData

extension ScreenInfo {
    static func newInstance() -> ScreenInfo {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "ScreenInfo"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! ScreenInfo
    }
}