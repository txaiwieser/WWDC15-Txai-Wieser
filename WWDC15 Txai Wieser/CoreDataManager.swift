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
        app1.appName = "Repel"
        app1.appIconName = "repel_appIcon"
        app1.backgroundImageName = "repel_background"
        app1.appID = "914081825"
        app1.available = true
        app1.videoName = "repel_video_promo_v05"
        app1.appDescription = "Repel is a game based on physics concepts. The purpose of the game is to solve puzzles, by interacting with the characters and finding out what abilities they have.\n\nThe objective of Repel is to entertain and gradually establish a relationship between the game and physics concepts.\n\nSo while playing and having fun, the player learns and is motivated to understand more about the concepts of the game.\n\nFinding out more about this challenging game than was hidden upon the universe of physics.\n\nThe idea behind Repel is to present basic elementary physics concepts to the player while enjoying a challenging puzzle.\n\nLearning to play and playing to learn."

        
        let app2 = App.newInstance()
        app2.appName = "Recolorindo o Reino"
        app2.appIconName = "recolorindo_appIcon"
        app2.backgroundImageName = "recolorindo_background"
        app2.appID = "00000000000000000" // Warning: Replace
        app2.available = false
        app2.videoName = ""
        app2.appDescription = "Recolorindo o Reino (Painting the Kingdom) provides a different gaming experience to kids.\n\nBeyond the education system, it encourages players to interact with the outside world to complete the challenges of the game.\n\nThe idea I had when I created this game was what could I do to encourage children to be active and have fun with their devices.\n\nIt uses sensors, such as the device camera, to capture real-world information and merge them in the game."
        
        let app2img1 = Image.newInstance()
        app2img1.imgName = "recolorindo_image1"
        app2.addImage(app2img1)
        
        let app2img2 = Image.newInstance()
        app2img2.imgName = "recolorindo_image2"
        app2.addImage(app2img2)
        
        let app2img3 = Image.newInstance()
        app2img3.imgName = "recolorindo_image3"
        app2.addImage(app2img3)
        
        
        
        
        let app3 = App.newInstance()
        app3.appName = "Ballphy"
        app3.appIconName = "ballphy_appIcon"
        app3.backgroundImageName = "ballphy_background"
        app3.appID = "00000000000000000" // Warning: Replace
        app3.available = false
        app3.videoName = "ballphy_video_demo_v01"
        app3.appDescription = "The idea behind Balphy is to present some of the basic elementary mechanical physics concepts to the player while he is enjoying a challenging puzzle.\n\n\"Gaming is fun. And learning should be fun too!\"\n\nThrough play, users learn about how the events of the real world happen, and they are required to solve physics related problems.\n\nAfter playing this game, players will be able to relate some of the game challenges with the real world, and in doing will improve their ability to master environmental understanding."

        
        let app4 = App.newInstance()
        app4.appName = "Shapes"
        app4.appIconName = "shapes_appIcon"
        app4.backgroundImageName = "shapes_background"
        app4.appID = "00000000000000000" // Warning: Replace
        app4.available = false
        app4.videoName = ""
        app4.appDescription = "Shapes is a simple game that I'm creating with my younger brother.\n\nIt encourages him to learn a programming language (Swift) and improve his design skills, while we have fun together.\n\nIn this game, geometric shapes go down on the screen and the player must turn a crown where there are molded shapes. The range that shapes appear decreases and the goal is to fit a maximum number of shapes in place subsequently."
        
        let app4img1 = Image.newInstance()
        app4img1.imgName = "shapes_image1"
        app4.addImage(app4img1)
        
        let app4img2 = Image.newInstance()
        app4img2.imgName = "shapes_image2"
        app4.addImage(app4img2)
        
        
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
        ach2.longDescription = "I started helping people with computers and electronic devices when I was little, and by the time I was in college it was like a part-time job for me.\n\nWhen I started my first adventures with web programming, I started doing some work for friends and acquaintances.  When I went to college I started working on PET's Intelligent Robotics Laboratory, programming in C, playing with Arduinos, Microcontrollers, Lego Mindstorms and a Rubik's Cube robot assembler.\n\nAfter more than a year working there, BEPiD began and I started to work on my own projects."
        
        
        let ach3 = Achievement.newInstance()
        ach3.name = "Technical Skills"
        ach3.iconName = "skills_icon"
        ach3.longDescription = "My skills related to mobile development are:\n\nProgramming Languages:\n   - Swift\n   - Objective-C\n   - C\n   - Java\n\nDesign:\n   - Sketch\n   - Photoshop\n   - After Effects\n   - 3DS Max\n"
        
        
        let ach4 = Achievement.newInstance()
        ach4.name = "Interests"
        ach4.iconName = "interests_icon"
        ach4.longDescription = "I am generally very interested in education, so I try to apply it in other things I like, such as applications and games with new ways of interaction.\n\nAlso, I really like electronics and physical objects embedded with electronics, software, sensors and connectivity."
        
        
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
        ee3.name = "FEDERAL UNIVERSITY OF RIO GRANDE DO SUL"
        ee3.time = "Started in 2012"
        ee3.about = "Computer engineering. UFRGS has one of the best computer engeneering courses in Brazil! I am proud to study there."
        
        
        let ee4 = EducationalEvent.newInstance()
        ee4.order = 2
        ee4.name = "CIC INFORMÁTICA"
        ee4.time = "Completed in 2009"
        ee4.about = "3D modeling and graphic designing technical classes."
        
        return [ee1, ee2, ee3, ee4]
    }
    
    
    func registerEvents(p:Person) -> [Event] {
        // Achievement
        let ev1 = Event.newInstance()
        ev1.name = "WWDC"
        ev1.iconName = "wwdc15_icon"
        ev1.smallDescription = "The epicenter\nof change."
        ev1.longDescription1 = "That's where I want to be!!\n\nBeing part of this change.\n\nRight in the epicenter of technology development.\n\nSharing experiences with amazing developers and learning from the best engineers."
        ev1.longDescription2 = "Winning the scholarship would be incredible.\n\nIt's the perfect opportunity to meet contacts Silicon Valley, interact with the best development community, and learn.\n\nThus, I can continue creating great apps and teaching others what I’ve learned."
        
        
        
        let ev2 = Event.newInstance()
        ev2.name = "Open Source"
        ev2.iconName = "opensource_icon"
        ev2.smallDescription = "Part of the learning process is sharing what you know with others."
        ev2.longDescription1 = "I created several projects on Github and they are available for anyone to see and use.\n\nThe most popular is TWControls!\n\nIt is a set of controls (buttons and switches) for SpriteKit.\n\nThe controls were written in Swift, using the power of clusures and optionals, and are very easy to use."
      
        
        
        let ev3 = Event.newInstance()
        ev3.name = "Projects"
        ev3.iconName = "appstore_icon"
        ev3.smallDescription = "My Projects!"
        
        
        
        let ev4 = Event.newInstance()
        ev4.name = "iOS"
        ev4.iconName = "iphone_icon"
        ev4.smallDescription = "iOS Development"
        ev4.longDescription1 = "Since I began studying iOS, I have been attending classes, reading, doing research and attending conferences to be up-to-date with all major frameworks available."
        ev4.longDescription2 = "This year, in addition to be helping new students at BEPiD, I had the opportunity to talk about memory management in Swift at CocoaHeadsBR-POA. It was a truly amazing and rewarding experience for me."
        ev4.longDescription3 = "Some of the main frameworks I worked with are:\n\n- SpriteKit\n\n- SceneKit\n\n- App Extensions\n\n- Touch ID\n\n- MapKit\n\n- And all major UIKit components"
        
        ev1.from = p; ev2.from = p; ev3.from = p; ev4.from = p
        return [ev1, ev2, ev3, ev4]
    }
    
    
    func registerScreenInfos(p:Person) -> [ScreenInfo] {
        // Achievement
        let si1 = ScreenInfo.newInstance()
        si1.order = 1
        si1.iconName = "location_icon"
        si1.text = "My name is, Txai Wieser. I am 22 years old and from Porto Alegre, Brazil. "
        
        let si2 = ScreenInfo.newInstance()
        si2.order = 2
        si2.iconName = "toy_icon"
        si2.text = "I have always been extremely curious about how things work. When I was a kid I would take my toys apart just to satisfy my curiosity and try to find out what made each toy light up, walk, or wind up."
        
        let si3 = ScreenInfo.newInstance()
        si3.order = 3
        si3.iconName = "electronic_icon"
        si3.text = "I became increasingly interested in electronic devices as I grew older. By the time I graduated from high school I was already certifying as an electronic technician."
        
        let si4 = ScreenInfo.newInstance()
        si4.order = 4
        si4.iconName = "computer_icon"
        si4.text = "My curiosity was not satisfied, however, and I pursued further knowledge of electronics and computers. I continued to study to get in to college and eventually began studying computer engineering at UFRGS!"
        
        let si5 = ScreenInfo.newInstance()
        si5.order = 5
        si5.iconName = "cellIcon_0"
        si5.text = "I already loved Apple and closely followed the mobile development world for a few years when I decided to learn how to develop iOS applications."
        
        let si6 = ScreenInfo.newInstance()
        si6.order = 6
        si6.iconName = "education_icon"
        si6.text = "I started taking a course from Stanford University on iTunes U and found out that there would be an iOS course offered in the town where I lived. I knew this was extremely rare and an incredible opportunity for me. I remember thinking to myself, \"I have to be chosen!\""
        
        let si7 = ScreenInfo.newInstance()
        si7.order = 7
        si7.iconName = "cellIcon_17"
        si7.text = "Fortunately, I was approved for the program and started as a student in the first edition of BEPiD (Brazilian Education Program for iOS Development), at PUCRS. It was an incredible year for me! I learned so many things, improved my technical skills and created amazing projects."
        
        
        let si8 = ScreenInfo.newInstance()
        si8.order = 8
        si8.iconName = "mac_icon"
        si8.text = "Another amazing event in my life was to be chosen to continue on BEPiD for another year, as senior student, continuing my projects and also helping new students."
        
        
        return [si1, si2, si3, si4, si5, si6, si7, si8]
    }
    
    func registerExtraInfo(p:Person) -> [ExtraInfo] {
        // Achievement
        let ei1 = ExtraInfo.newInstance()
        ei1.name = "Random Paths"
        ei1.iconName = "veins_icon"
        ei1.segueID = "ExperimentsSegue"
        ei1.about = "I enjoy algorithms, random paths and simulating real things in computers. When Swift was announced, I started doing tests using SriteKit.\n\nThis is an example of it.\n\nThe main artery follows random paths and suddenly splits into many other mini-arteries."
        
        let ei2 = ExtraInfo.newInstance()
        ei2.name = "Trees"
        ei2.iconName = "trees_icon"
        ei2.segueID = "ExperimentsSegue"
        ei2.about = "This is another example of a project I was doing while learning Swift\n\nA simple node-based tree that has many randomized parameters for a more realistic result."

        let ei3 = ExtraInfo.newInstance()
        ei3.name = "Swift <3"
        ei3.iconName = "swift_icon"
        ei3.segueID = ""
        ei3.about = "When I was watching the WWDC14 stream and Swift was announced I was shocked. I used to love Objective-C and with Swift everything I had learned would become useless.\n\nBut I was wrong. After I started testing, I was starting to enjoy the language more and more! When I have to program in Objective-C now, I see how much I love this new language and its incredible features."

        
        let ei4 = ExtraInfo.newInstance()
        ei4.name = "Brazil"
        ei4.iconName = "brazil_icon"
        ei4.segueID = ""
        ei4.about = "I love my country!\n\nI live in Porto Alegre - RS, in the southernmost part of Brazil!"

        
        let ei5 = ExtraInfo.newInstance()
        ei5.name = "Community Work"
        ei5.iconName = "community_icon"
        ei5.segueID = ""
        ei5.about = "Always when I can I volunteer to do community work and help others!"
        
        let ei6 = ExtraInfo.newInstance()
        ei6.name = "Drones"
        ei6.iconName = "drone_icon"
        ei6.segueID = ""
        ei6.about = "I have also been admiring and researching drones for some time. During my last vacation in college I built one from scratch. I chose a hexacopter, and even designed and manufactured all of the mechanics myself.\n\nIt was an amazing experience and I plan to build another version in the near future."
        
        let ei7 = ExtraInfo.newInstance()
        ei7.name = "Sports"
        ei7.iconName = "windsurf_icon"
        ei7.segueID = ""
        ei7.about = "Besides my technological interests, I like sports - especially water sports.\n\nI love Windsurfing!\n\nI windsurf with my father and cousins as much as I possibly can."
        
        
        let ei8 = ExtraInfo.newInstance()
        ei8.name = "Music"
        ei8.iconName = "music_icon"
        ei8.segueID = ""
        ei8.about = "Music is also a huge part of my life. I am always listening to music and discovering new artists.\n\nPlaying piano is one of my favorite hobbies and brings me tremendous pleasure to express myself musically.\n\nMusic inspires every aspect of my life!"
        
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