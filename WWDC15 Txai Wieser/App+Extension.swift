//
//  App+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 07/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import CoreData

extension App {
    static func newInstance() -> App {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "App"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! App
    }
    
    func addImage(value:Image) {
        var items = self.mutableSetValueForKey("images");
        items.addObject(value)
    }
    
    func orderedImagesArray() -> [Image] {
        let array = Array(images) as! [Image]
        return sorted(array){ $0.imgName < $1.imgName }
    }
    
}