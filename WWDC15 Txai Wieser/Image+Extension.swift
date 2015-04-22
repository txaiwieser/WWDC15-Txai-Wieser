//
//  Image+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 17/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

extension Image {
    static func newInstance() -> Image {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "Image"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Image
    }
}