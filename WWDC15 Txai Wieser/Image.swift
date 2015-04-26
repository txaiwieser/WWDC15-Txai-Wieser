//
//  Image.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 26/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import Foundation
import CoreData

@objc(Image)
class Image: NSManagedObject {

    @NSManaged var imgName: String
    @NSManaged var fromApp: App
    @NSManaged var fromScreen: ScreenInfo

}
