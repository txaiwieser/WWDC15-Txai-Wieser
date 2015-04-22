//
//  DissmissModalSegue.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 16/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class DissmissModalSegue: UIStoryboardSegue {
   
    override func perform() {
        let sourceViewController = self.sourceViewController as! UIViewController
        let destinationViewController = self.destinationViewController as! UIViewController
        
        sourceViewController.view.addSubview(destinationViewController.view)
        destinationViewController.view.frame = destinationViewController.view.frame
        destinationViewController.view.transform = CGAffineTransformMakeTranslation(0, -sourceViewController.view.frame.size.height)
        destinationViewController.view.alpha = 1.0
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: { () -> Void in
            destinationViewController.view.transform = CGAffineTransformMakeTranslation(0, 0)
        }) { (finished) -> Void in
            destinationViewController.view.removeFromSuperview()
            sourceViewController.presentViewController(destinationViewController, animated: false, completion: nil)
        }
    }
}
