//
//  BluredViewController.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 21/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import UIKit

class BluredViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.alpha = 0
        effectView.frame = self.view.frame
        effectView.tag = 9999
        self.view.insertSubview(effectView, atIndex: 0)
        
        let effect2 = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let effectView2 = UIVisualEffectView(effect: effect2)
        effectView2.alpha = 1
        effectView2.frame = self.view.frame
        effectView2.tag = 7777
        self.view.insertSubview(effectView2, atIndex: 0)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        let white = self.view.viewWithTag(7777) as! UIVisualEffectView
        let dark = self.view.viewWithTag(9999) as! UIVisualEffectView
        
//        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            white.alpha = 1
//        }, completion: nil)
        
        UIView.animateWithDuration(1.4, delay: 0.3, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            white.alpha = 0
            dark.alpha = 1
            }) { (finished) -> Void in
                white.removeFromSuperview()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
