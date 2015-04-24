//
//  ViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 01/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {

    init() {
        resetCoreData()
        populateCoreData()
    }
    
    func populateCoreData() {
        let txai = Person.newInstance()
        txai.firstName = "Txai"
        txai.middleName = "Durigon"
        txai.lastName = "Wieser"
        txai.profileImageName = "TxaiWieser_profilePic"
        let comps = NSDateComponents(); comps.day = 02; comps.month = 11; comps.year = 1992
        txai.birthday = NSCalendar.currentCalendar().dateFromComponents(comps)!.timeIntervalSince1970
        txai.email = "txai.wieser@icloud.com"
        txai.twitter = "twitter.com/txaidw"
        txai.facebook = "fb.com/txaidw"
        txai.website = "inf.ufrgs.br/~tdwieser"
        
        
        
        
        txai.addApps(registerApps(txai))
        txai.addAchievements(registerAchievements(txai))
        txai.addEvents(registerEvents(txai))
        txai.addScreenInfos(registerScreenInfos(txai))
        txai.addExtraInfos(registerExtraInfo(txai))
        txai.addEducationalEvents(registerEducationalEvents(txai))
        
        let delegate = AppDelegate.$
        var err: NSErrorPointer = nil
        delegate.managedObjectContext!.save(err)

    }
    
    func registerApps(p:Person) -> [App] {
        // Apps
        let app1 = App.newInstance()
        app1.appName = "REPEL"
        app1.appIconName = "repel_appIcon"
        app1.backgroundImageName = "repel_background"
        app1.appID = "00000000000000000" // Warning: Replace
        app1.available = false
        app1.appDescription = "REPEL is a game based on physics concepts. The purpose of the game is to solve puzzles, interacting with the characters and finding out the abilities they have.\n The objective of REPEL is to entertain and gradually establish a relation between the game and the physics concepts.\n So while playing and having fun, the player learns and also gets motivated to understand more about the concepts of the game.\n Find more about this challenging game that was hidden upon the universe of physics.\n The idea behind REPEL is to present some of the basic elementary physics concepts to the player while he is enjoying a challenging puzzle.\n Learning to play and playing to learn."
        
        
        let app1img = Image.newInstance()
        app1img.imgName = "repel_img1"
        app1.addImage(app1img)
        
        let app2img = Image.newInstance()
        app2img.imgName = "repel_background"
        app1.addImage(app2img)
        
        
        let app2 = App.newInstance()
        app2.appName = "Recolorindo o Reino"
        app2.appIconName = "recolorindo_appIcon"
        app2.backgroundImageName = "recolorindo_background"
        app2.appID = "00000000000000000" // Warning: Replace
        app2.available = false
        app2.appDescription = "Painting the Kingdom is a game that aims to bring a different experience to the kids in addition to the educational resources that others children's games have.\n Paining the Kingdom brings a rich experience, encouraging players to interact with the outside world to complete challenges of the game."
        
        
        
        
        let app3 = App.newInstance()
        app3.appName = "Ballphy"
        app3.appIconName = "ballphy_appIcon"
        app3.backgroundImageName = "ballphy_background"
        app3.appID = "00000000000000000" // Warning: Replace
        app3.available = false
        app3.appDescription = "Through play, users learn about how the events of the real world can be explained with physical laws. As they play, users have fun, solve problems, and can even learn basic physics.\n After playing this game, users will be able to relate some of the game challenges with the real world events, and with that it will be easy to master the environment understanding."
        
        
        
        
        
        let app4 = App.newInstance()
        app4.appName = "Shapes"
        app4.appIconName = "shapes_appIcon"
        app4.backgroundImageName = "shapes_background"
        app4.appID = "00000000000000000" // Warning: Replace
        app4.available = false
        app4.appDescription = "Shapes is a game for children learning to geometric shapes. Its a challenging game that has leaderboards."
        
        app1.developer = p; app2.developer = p; app3.developer = p; app4.developer = p
        return [app1, app2, app3, app4]
    }

    
    func registerAchievements(p:Person) -> [Achievement] {
        // Achievement
        let ach1 = Achievement.newInstance()
        ach1.name = "Education"
        ach1.iconName = "education_icon"

        
        let ach2 = Achievement.newInstance()
        ach2.name = "Professional Background"
        ach2.iconName = "professional_icon"
        ach2.longDescription = "TextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell. TextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell. \n\n\nTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell"
        
        let ach3 = Achievement.newInstance()
        ach3.name = "Technical Skills"
        ach3.iconName = "skills_icon"
        ach3.longDescription = "TextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell. TextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell. \n\n\nTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell"
        
        let ach4 = Achievement.newInstance()
        ach4.name = "Interests"
        ach4.iconName = "interests_icon"
        ach4.longDescription = "TextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell. TextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell. \n\n\nTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCellTextTableViewCell"
        
        
        ach1.from = p; ach2.from = p; ach3.from = p; ach4.from = p
        return [ach1, ach2, ach3, ach4]
    }
    
    func registerEducationalEvents(p:Person) -> [EducationalEvent] {
        // Achievement
        let ee1 = EducationalEvent.newInstance()
        ee1.order = 1
        ee1.name = "E.E.E.M ÉRICO VERÍSSIMO"
        ee1.time = "Completed in 2009"
        ee1.about = "High School."
        
        let ee2 = EducationalEvent.newInstance()
        ee2.order = 3
        ee2.name = "E.E.P. SENAI PORTO ALEGRE"
        ee2.time = "Jul 2009 - Jul 2011"
        ee2.about = "Electronics Technician (Post High School) - Software and Hardware."
        
        let ee3 = EducationalEvent.newInstance()
        ee3.order = 4
        ee3.name = "UFRGS - FEDERAL UNIVERSITY OF RIO GRANDE DO SUL"
        ee3.time = "Started in 2012"
        ee3.about = "Computer Engineering. UFRGS has one of the best Computer Engeneering course of Brazil! I am proud to study there."
        
        
        let ee4 = EducationalEvent.newInstance()
        ee4.order = 2
        ee4.name = "CIC INFORMÁTICA"
        ee4.time = "Completed in 2009"
        ee4.about = "3D Modeling and Graphic Designing technical classes."
        
        return [ee1, ee2, ee3, ee4]
    }
    
    
    func registerEvents(p:Person) -> [Event] {
        // Achievement
        let ev1 = Event.newInstance()
        ev1.name = "WWDC"
        ev1.iconName = "wwdc15_icon"
        ev1.smallDescription = "The epicenter\nof change."
        ev1.longDescription1 = "That's where I want to be!\n\nBeing part of this change!\n\nRight in the epicenter of technology development!\n\nSharing experiences with amazing developers, and learning from the best engineers."
        ev1.longDescription2 = "Winning the scholarship would be incredible for me!\n\nIt's the perfect chance to meet Silicon Valley, interact with the best development community and learn a lot.\n\nThus, I can continue creating great apps and teaching others what I’ve learned."
        
        
        
        let ev2 = Event.newInstance()
        ev2.name = "Open Source"
        ev2.iconName = "opensource_icon"
        ev2.smallDescription = "Part of the learning process is sharing what you know with others."
        ev2.longDescription1 = "I made available some of my projects on Github for anyone to see and use.\n\nThe most popular is TWControls!\n\nIt is a set of controls (buttons and switches) for SpriteKit.\n\nThe controls were written in Swift, using the power of clusures and optionals, and are very easy to use!"
      
        
        
        let ev3 = Event.newInstance()
        ev3.name = "Projects"
        ev3.iconName = "appstore_icon"
        ev3.smallDescription = "My Projects!"
        
        
        
        let ev4 = Event.newInstance()
        ev4.name = "BEPiD"
        ev4.iconName = "iphone_icon"
        ev4.smallDescription = "WOW"
        ev4.longDescription1 = "Such great"
        ev4.longDescription2 = ":p"
        ev4.longDescription3 = "hehehe"
        
        ev1.from = p; ev2.from = p; ev3.from = p; ev4.from = p
        return [ev1, ev2, ev3, ev4]
    }
    
    
    func registerScreenInfos(p:Person) -> [ScreenInfo] {
        // Achievement
        let si1 = ScreenInfo.newInstance()
        si1.order = 1
        si1.iconName = "education_icon"
        si1.text = "My name is Txai Wieser, I’m 22 years old and I’m from Porto Alegre, Brazil."
        
        
        let si2 = ScreenInfo.newInstance()
        si2.order = 2
        si2.iconName = "education_icon"
        si2.text = "I have always been very curious about how things work. Even as a boy I already took apart my toys to see how they worked."
        
        let si3 = ScreenInfo.newInstance()
        si3.order = 3
        si3.iconName = "education_icon"
        si3.text = "As time passed, I started to be more interested in electronic devices. Right after finishing high school I was also certified as an Electronic Technician."
        
        let si4 = ScreenInfo.newInstance()
        si4.order = 4
        si4.iconName = "education_icon"
        si4.text = "I was not yet completely satisfied. My interest in computers made me continue studying to get into a university. Then I started Computer Engineering at UFRGS!"
        
        let si5 = ScreenInfo.newInstance()
        si5.order = 5
        si5.iconName = "education_icon"
        si5.text = "I already was an Apple lover and already followed the mobile development world for a few years when I decided to learn to develop iOS applications."
        
        let si6 = ScreenInfo.newInstance()
        si6.order = 6
        si6.iconName = "education_icon"
        si6.text = "Just after I started the course from Stanford on iTunes I found out that there would be an iOS course in town I lived. I knew this was an extremely rare and incredible opportunity! I just thought: \"I need to be chosen.\""
        
        
        let si7 = ScreenInfo.newInstance()
        si7.order = 7
        si7.iconName = "education_icon"
        si7.text = "Fortunately, I was approved, and I started as a student in the first edition of BEPiD (Brazilian Education Program for iOS Development), at PUCRS. It was an incredible year, I learned many things, improved my technical skills and created amazing projects."
        
        
        let si8 = ScreenInfo.newInstance()
        si8.order = 8
        si8.iconName = "education_icon"
        si8.text = "Another amazing event in my life was to be chosen to continue on BEPiD for another year, as senior student, continuing my projects and also helping new students."
        
        
        return [si1, si2, si3, si4, si5, si6, si7, si8]
    }
    
    func registerExtraInfo(p:Person) -> [ExtraInfo] {
        // Achievement
        let ei1 = ExtraInfo.newInstance()
        ei1.name = "Veins"
        ei1.iconName = "veins_icon"
        ei1.segueID = "ExperimentSegue"
        ei1.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."
        
        let ei2 = ExtraInfo.newInstance()
        ei2.name = "Trees"
        ei2.iconName = "trees_icon"
        ei2.segueID = "ExperimentsSegue"
        ei2.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."

        let ei3 = ExtraInfo.newInstance()
        ei3.name = "Swift"
        ei3.iconName = "swift_icon"
        ei3.segueID = ""
        ei3.about = "Swift blab balbalbalor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."

        
        let ei4 = ExtraInfo.newInstance()
        ei4.name = "Brazil"
        ei4.iconName = "brazil_icon"
        ei4.segueID = ""
        ei4.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."

        
        let ei5 = ExtraInfo.newInstance()
        ei5.name = "Community Work"
        ei5.iconName = "community_icon"
        ei5.segueID = ""
        ei5.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."
        
        let ei6 = ExtraInfo.newInstance()
        ei6.name = "Drones"
        ei6.iconName = "drone_icon"
        ei6.segueID = ""
        ei6.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."
        
        let ei7 = ExtraInfo.newInstance()
        ei7.name = "NO DESCRIPTION"
        ei7.iconName = ""
        ei7.segueID = ""
        ei7.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."
        
        
        let ei8 = ExtraInfo.newInstance()
        ei8.name = "NO DESCRIPTION"
        ei8.iconName = ""
        ei8.segueID = ""
        ei8.about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce a quam fringilla, ullamcorper arcu eget, rutrum risus.\n\nIn hac habitasse platea dictumst. Morbi vel sagittis lectus. Fusce volutpat libero vitae urna scelerisque vehicula.\nPhasellus blandit varius erat, non consectetur massa consequat a."
        
        return [ei1, ei2, ei3, ei4, ei5, ei6, ei7, ei8]
    }
    
    
    func resetCoreData() {
        
        let appDel = AppDelegate.$
        
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Person")
        
        let myList = context.executeFetchRequest(request, error: nil)
        
        if let list = myList {
            for p in list {
                context.deleteObject(p as! NSManagedObject)
            }
            context.save(nil)
        }
        
    }
}