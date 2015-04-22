//
//  GameScene.swift
//  TreesGame_FirstTree
//
//  Created by Txai Wieser on 7/29/14.
//  Copyright (c) 2014 Txai Wieser. All rights reserved.
//

import SpriteKit

class TreesGameScene: SKScene {
    var activeBranches:[SKShapeNode] = []
    var branches:[SKShapeNode] = []
    var depth: Int = 0
    var maxDepth: Int = 2
    var shouldRandomize = true
    var simetric = false
    var wind = false

    var maxLenght:CGFloat = 100.0/5.0
    var minLenght:CGFloat = 50.0/8.0
    var maxWidth:CGFloat = 1//18.0
    var minWidth:CGFloat = 1//3.0
    
    var minR1:CGFloat = 2.0
    var maxR1:CGFloat = 10.0
    var minR2:CGFloat = 8.0
    var maxR2:CGFloat = 20.0
    
    var rand_cons:CGFloat = 0.9

    
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = SKColor.whiteColor()
        resetAndStartAgain()
    }
    
    func resetAndStartAgain() {
        setupTree()
        
        for (var i=0; i<maxDepth; i++)
        {
            createAnotherLevel()
        }

    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
//        self.maxDepth = Int(self.viewController.sli0.value)
//        self.shouldRandomize = self.viewController.bt1.on
//        self.minLenght = CGFloat(self.viewController.sli1.value)
//        self.maxLenght = CGFloat(self.viewController.sli4.value)
//        self.minWidth = CGFloat(self.viewController.sli2.value)
//        self.maxWidth = CGFloat(self.viewController.sli5.value)
//        self.minR1 = CGFloat(self.viewController.sli3.value)
//        self.maxR1 = CGFloat(self.viewController.sli6.value)
//        self.minR2 = CGFloat(self.viewController.sli7.value)
//        self.maxR2 = CGFloat(self.viewController.sli8.value)
//        self.rand_cons = CGFloat(self.viewController.sli9.value)
//        self.simetric = self.viewController.bt2.on
//        self.wind = self.viewController.bt3.on
    }
    
    func setupTree() {
        
        if(!branches.isEmpty) {
            branches.removeAll(keepCapacity: false)
            self.removeAllChildren()
        }
        depth = 0
        var branch = createBranch()
        branch.position.x = frame.width/2
        branch.position.y = 100
        addChild(branch)
        branches = [branch]
        activeBranches = [branch]
    }
    
    func createBranch() -> SKShapeNode {
        var currWidth:CGFloat = (CGFloat((maxDepth-1)-depth)*(maxWidth-minWidth)/CGFloat(maxDepth-1)) + minWidth
        var currLength:CGFloat = (CGFloat((maxDepth-1)-depth)*(maxLenght-minLenght)/CGFloat(maxDepth-1)) + minLenght
        
        var subBranch = SKShapeNode()
        
        var path = CGPathCreateMutable();
        var lenght:CGFloat = (shouldRandomize ? randomNumber(rand_cons, to: 1.0) * currLength : currLength)
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, 0, lenght)
        subBranch.path = path
        subBranch.lineWidth = (shouldRandomize ? randomNumber(rand_cons, to: 1.0) * currWidth : currWidth)
        subBranch.lineCap = kCGLineCapRound
        subBranch.lineJoin = kCGLineJoinRound
        subBranch.strokeColor = SKColor.blackColor()
        subBranch.name = "branch"+String(depth)
        return subBranch
    }
    
    func configureBranch(childBranch:SKShapeNode, left:Bool, superBranch:SKShapeNode) {
        //trace(branch.name)
        let height = superBranch.frame.height / cos(superBranch.zRotation)

        childBranch.position.y = height*0.97
        var random1:CGFloat = (!wind ? 0 : (shouldRandomize ? randomNumber(minR1, to: maxR1) : 3))
        let random2:CGFloat = (shouldRandomize ? randomNumber(minR2, to: maxR2) : 8)
        
        if simetric && Int(arc4random_uniform(3)) == 1 { random1 = -random1 }
        
        var rot100:CGFloat = 0;
        
        if left {
            rot100 = random1+random2
        } else {
            rot100 = random1-random2
        }
        
        let rotation = rot100*CGFloat(M_PI)/100.0
        childBranch.zRotation = rotation
        
        
        
        superBranch.addChild(childBranch)
        branches.append(childBranch)
        
    }
    
    func createAnotherLevel() {
        //        if (depth > maxDepth+1) {
        //            setupTree();
        //            return
        //        }
        
        var abs: [SKShapeNode] = [];
        
        while (activeBranches.count > 0) {
            
            let supBranch = activeBranches.removeLast()
            
            let childL = createBranch()
            configureBranch(childL, left: true, superBranch: supBranch)
            abs.append(childL)
            
            let childR = createBranch()
            configureBranch(childR, left: false, superBranch: supBranch)
            abs.append(childR)
            
        }
        depth++
        activeBranches = abs
    }
    
    func randomNumber(from:CGFloat, to:CGFloat) -> CGFloat {
        if (from <= 0) {
            return ( ( CGFloat( ( Int(arc4random()) % Int(((to+(-from))*100.0)) ) ) )/100.0 ) + ( from )
        } else {
            var range:UInt32 = UInt32(to-from);
            return CGFloat(Int(arc4random_uniform(range*100))/100) + from
        }
        
    }
}