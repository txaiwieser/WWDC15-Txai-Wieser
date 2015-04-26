//
//  OngoingVeins.swift
//  OngoingVeins_SecondTest
//
//  Created by Txai Wieser on 02/08/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

import SpriteKit


class OngoingVein: ShapeNodeDrawer {
    
    // FIXME:
    //internal /*class*/ let MAX_THICKNESS:Float = 10
    //internal /*class*/ let MAX_DEPTH:Float = 2000

    var manager:OngoingVeinsManager!

    // public properties:
    var myX:Float = 0
    var myY:Float = 0
    
    // private properties:
    var angle:Float = 0
    var thickness:Float = 0
    var count:Int = 0
    var originalThickness:Float = 0
    var grow:Bool = true
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(p_name:String, p_x:Float, p_y:Float, p_thickness:Float, p_angle:Float, p_manager:OngoingVeinsManager) {
        super.init(myTest: p_name)
        name = p_name
        myX = p_x
        myY = p_y
        thickness = p_thickness
        angle = p_angle
        manager = p_manager
        originalThickness = p_thickness
        
        lineStyle(p_thickness, color: UIColor.redColor())
        //0x770000+(MAX_THICKNESS-thickness)*35,30+thickness/MAX_THICKNESS*70)

    }
    
    func updateThisVein() {
        if grow {
            growMethod()
        }
        else {
            fadeDownMethod()
        }
    }
    
    
    func growMethod() {
        let floatVariable:Float = OngoingVein.MAX_THICKNESS() - thickness + 1
        let randomMax = floatVariable*20
        
        let asd:Float = Float(Int.random(min: 0, max: Int(randomMax*100)))/100
        angle += (Float(M_PI)/180.0) * (asd - randomMax/2)
        
        
        var length:Float = 2;//Float.random(lower: 0, upper: 7) + floatVariable + 2
        
        
        myX += length*cos(angle)
        myY += length*sin(angle)
        
        lineTo(CGPoint(x: CGFloat(myX), y: CGFloat(myY)))
        
        count++
        checkIfShouldCreateSubVeins()
    }
    
    
    func checkIfShouldCreateSubVeins() {
        
        let a1:Bool = thickness > 1
        let a11:Bool = thickness == OngoingVein.MAX_THICKNESS()
        let a12:Int = (a11 ? 6 : Int(2.3*thickness))
        let a13:Int = Int.random(min: 0, max: a12)
        let a2:Bool = (a13 == 1)
        let a:Bool = a1 && a2
        
        if (a) {
            
            let xi:Float = Float(position.x)+myX
            let yi:Float = Float(position.y)+myY
            let thi:Float = thickness - 1 - Float(arc4random_uniform(UInt32(thickness-1)))
            
            manager.createVein(thi, p_x: xi, p_y: yi, p_angle: angle)
        }
        
        
        let b1:Bool = thickness < OngoingVein.MAX_THICKNESS()
        let b2:Bool = ( Float(count) > (Float(Int.random(min: 0, max: 220))/10)*thickness )
        let b:Bool = b1 && b2
        
        if (b) {
            count = 0
            thickness--;
            lineStyle(thickness, color: UIColor.redColor()) //0x770000+t*35,30+thickness/MAX_THICKNESS*70)
            if (thickness == 0) {
                count = 130+Int(originalThickness*30)
                grow = false
            }
        } else {
            count++
        }
        
        
        let estaComTamanhoMaximo:Bool = ( thickness == OngoingVein.MAX_THICKNESS() )
        if (estaComTamanhoMaximo && count >= 20) {
            zPosition = zPosition + 1//%1000
            let xi:Float = Float(position.x)+myX
            let yi:Float = Float(position.y)+myY
            manager.createVein(thickness, p_x: xi, p_y: yi, p_angle: angle)
            count = 440
            grow = false
        }
        println("")
    }
    
    func fadeDownMethod() {
        count -= 2
        alpha = myMin(alpha, b: CGFloat(count))
        if (count <= 0) {
            removeFromParent()
        }
    }
    
    
    
    func myMin <T : Comparable> (a: T, b: T) -> T {
        if a > b {
            return b
        }
        return a
    }
    
    // FIXME:
    class func MAX_THICKNESS() -> Float {
        return 6
    }
    class func MAX_DEPTH() -> Float {
        return 2000
    }
}
