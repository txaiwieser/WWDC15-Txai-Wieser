//
//  GameScene.swift
//  OngoingVeins_SecondTest
//
//  Created by Txai Wieser on 02/08/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

import SpriteKit

class VeinsGameScene: SKScene {
   var mainManager:OngoingVeinsManager!
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(size: CGSize) {
        mainManager = OngoingVeinsManager(initialPosition: CGPoint(size: size/2), size: size)
        
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Avenir Next - Regular")
        myLabel.text = "Random Paths - \"Veins\"";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetHeight(self.frame)-60);
        
        self.addChild(myLabel)
        
        addChild(mainManager)
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        /* Called when a touch begins */
//        
//        for touch: AnyObject in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeMake(100, 100))
//            sprite.position = location
//            self.addChild(sprite)
//        }
//    }
//   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        mainManager.updateVeinManager()
    }
}