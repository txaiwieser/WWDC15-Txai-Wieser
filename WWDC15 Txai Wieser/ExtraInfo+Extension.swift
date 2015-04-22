//
//  ExtraInfo+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 21/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

extension ExtraInfo {
    static func newInstance() -> ExtraInfo {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "ExtraInfo"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! ExtraInfo
    }
}