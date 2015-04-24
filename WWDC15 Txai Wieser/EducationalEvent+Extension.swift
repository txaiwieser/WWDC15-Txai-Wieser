//
//  EducationalEvent+Extension.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 24/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import UIKit
import CoreData

extension EducationalEvent {
    static func newInstance() -> EducationalEvent {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "EducationalEvent"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! EducationalEvent
    }
}