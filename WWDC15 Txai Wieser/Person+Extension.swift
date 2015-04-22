//
//  Person+Extension.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 01/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//
import UIKit
import CoreData


extension Person {
    static func newInstance() -> Person {
        let appDelegate = AppDelegate.$
        let context = appDelegate.managedObjectContext!
        let entityName = "Person"
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Person
    }

    // Apps
    func addApps(values:[App]) {
        for app in values
        {
            addApp(app)
        }
    }

    func addApp(value:App) {
        var items = self.mutableSetValueForKey("myApps");
        items.addObject(value)
    }
    
    func removeApp(value:App) {
        var items = self.mutableSetValueForKey("myApps");
        items.removeObject(value)
    }
    
    func orderedAppsArray() -> [App] {
        let array = Array(myApps) as! [App]
        return sorted(array){ $0.appName < $1.appName }
    }
    
    
    
    // Achievements
    func addAchievements(values:[Achievement]) {
        for achiev in values {
            addAchievement(achiev)
        }
    }
    
    func addAchievement(value:Achievement) {
        var items = self.mutableSetValueForKey("lifeAchievements");
        items.addObject(value)
    }
    
    func removeAchievement(value:Achievement) {
        var items = self.mutableSetValueForKey("lifeAchievements");
        items.removeObject(value)
    }
    
    func orderedAchievementsArray() -> [Achievement] {
        let array = Array(lifeAchievements) as! [Achievement]
        return sorted(array){ $0.name < $1.name }
    }
    
    // Events
    func addEvents(values:[Event]) {
        for event in values {
            addEvent(event)
        }
    }
    
    func addEvent(value:Event) {
        var items = self.mutableSetValueForKey("lifeEvents");
        items.addObject(value)
    }
    
    func removeEvent(value:Event) {
        var items = self.mutableSetValueForKey("lifeEvents");
        items.removeObject(value)
    }
    
    func orderedEventsArray() -> [Event] {
        let array = Array(lifeEvents) as! [Event]
        return sorted(array){ $0.name < $1.name }
    }
    
    
    
    // ScreenInfos
    func addScreenInfos(values:[ScreenInfo]) {
        for achiev in values {
            addScreenInfo(achiev)
        }
    }
    
    func addScreenInfo(value:ScreenInfo) {
        var items = self.mutableSetValueForKey("screenInfos");
        items.addObject(value)
    }
    
    func removeScreenInfo(value:ScreenInfo) {
        var items = self.mutableSetValueForKey("screenInfos");
        items.removeObject(value)
    }
    
    func orderedScreenInfosArray() -> [ScreenInfo] {
        let array = Array(screenInfos) as! [ScreenInfo]
        return sorted(array){ $0.order < $1.order }
    }
    
    // ExtraInfos
    func addExtraInfos(values:[ExtraInfo]) {
        for achiev in values {
            addExtraInfo(achiev)
        }
    }
    
    func addExtraInfo(value:ExtraInfo) {
        var items = self.mutableSetValueForKey("extraInfos");
        items.addObject(value)
    }
    
    func removeExtraInfo(value:ExtraInfo) {
        var items = self.mutableSetValueForKey("extraInfos");
        items.removeObject(value)
    }
    
    func orderedExtraInfosArray() -> [ExtraInfo] {
        let array = Array(extraInfos) as! [ExtraInfo]
        return sorted(array){ $0.name < $1.name }
    }
}