//
//  EducationalEvent.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 24/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import Foundation
import CoreData

@objc(EducationalEvent)
class EducationalEvent: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var time: String
    @NSManaged var about: String
    @NSManaged var order: Int16

}
