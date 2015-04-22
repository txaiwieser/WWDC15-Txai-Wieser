//
//  Person.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 21/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

@objc(Person)
class Person: NSManagedObject {

    @NSManaged var birthday: NSTimeInterval
    @NSManaged var email: String
    @NSManaged var facebook: String
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var middleName: String
    @NSManaged var profileImageName: String
    @NSManaged var twitter: String
    @NSManaged var website: String
    @NSManaged var lifeAchievements: NSSet
    @NSManaged var lifeEvents: NSSet
    @NSManaged var myApps: NSSet
    @NSManaged var screenInfos: NSSet
    @NSManaged var extraInfos: NSSet

}
