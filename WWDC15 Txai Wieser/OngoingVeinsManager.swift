//
//  OngoingVeinsManager.swift
//  OngoingVeins_SecondTest
//
//  Created by Txai Wieser on 15/08/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

import SpriteKit

class OngoingVeinsManager: SKNode {
    var mainArtery:OngoingVein!
    let testMode = true

    let focus:CGSize!
    
    var depth:Float = 0
    var xvel:Float = 0
    var yvel:Float = 0
    var rvel:Float = 0
    var canvas:Int = 0

    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(initialPosition:CGPoint, size:CGSize) {
        focus = size * 0.6
        super.init()
        position = initialPosition
        
        
        if testMode {
            let node = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(50, 50))
            node.alpha = 0.5
            node.position = CGPointZero
            addChild(node)
        }

        
        createVein(OngoingVein.MAX_THICKNESS(), p_x: 0, p_y: 0, p_angle: Float(Int.random(min: 0, max: 600))/100)
    }
    
    func createVein(p_thickness:Float, p_x:Float, p_y:Float, p_angle:Float) {
        depth = ( ++depth%OngoingVein.MAX_DEPTH() )

        let v = OngoingVein(p_name: "vein_"+String(format:"%f", depth), p_x: p_x, p_y: p_y, p_thickness: p_thickness, p_angle: p_angle, p_manager: self)
        
        addChild(v)
        
        if (p_thickness == OngoingVein.MAX_THICKNESS()) {
            mainArtery = v
        }
    }
    
    func cameraEffectsOnNode() {
        // Position Effects
        position.x -= focus.width/2
        position.y -= focus.height/2
        
        xvel -= (mainArtery.myX+Float(position.x))/Float(focus.width);
        yvel -= (mainArtery.myY+Float(position.y))/Float(focus.height);
        
        xvel *= 0.97
        yvel *= 0.97
        
        position.x += CGFloat(xvel)
        position.y += CGFloat(yvel)
        
        position.x += focus.width/2
        position.y += focus.height/2
        
        
        // Rotation Effects
        var r:Float = mainArtery.angle*180/Float(M_PI)
        r = r%180+180
        
        //#warning zrotation of scene
        
        rvel -= (r + Float(zRotation))/3000
        rvel *= 0.91
        //zRotation += CGFloat(rvel)
    }
    
    
    func updateVeinManager() {
        
        cameraEffectsOnNode()
        
        for someValue in children {
            if let veinItem = someValue as? OngoingVein {
                veinItem.updateThisVein()
            }
        }
    }
}
