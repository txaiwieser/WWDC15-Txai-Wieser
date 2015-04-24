//
//  ExperimentsShowViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 15/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import SpriteKit

class ExperimentsAppleTVViewController: UIViewController {

    @IBOutlet weak var skView: SKView!
    
    var experiment:Int = 0
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        skView.backgroundColor = UIColor.clearColor()
        skView.allowsTransparency = true
        switch experiment {
        case 3:
            self.thirdExperiment()
        case 2:
            self.secondExperiment()
        default:
            self.firstExperiment()
        }
    }
    
    func firstExperiment() {
        let scene = TreesGameScene(size: skView.bounds.size)
        skView.presentScene(scene, transition: SKTransition.fadeWithColor(SKColor.scarlet(), duration: 3))
    }
    func secondExperiment() {
        let scene = VeinsGameScene(size: skView.bounds.size)
        skView.presentScene(scene, transition: SKTransition.fadeWithColor(SKColor.scarlet(), duration: 3))
    }
    func thirdExperiment() {
        let scene = VeinsGameScene(size: skView.bounds.size)
        skView.presentScene(scene, transition: SKTransition.fadeWithColor(SKColor.scarlet(), duration: 3))
    }
}
