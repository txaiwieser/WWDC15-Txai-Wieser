//
//  App.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import Foundation
import CoreData

@objc(App)
class App: NSManagedObject {

    @NSManaged var appDescription: String
    @NSManaged var appIconName: String
    @NSManaged var appID: String
    @NSManaged var appName: String
    @NSManaged var videoName: String
    @NSManaged var available: Bool
    @NSManaged var backgroundImageName: String
    @NSManaged var developer: Person
    @NSManaged var images: NSSet

}
