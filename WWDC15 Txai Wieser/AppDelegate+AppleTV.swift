//
//  AppDelegate+AppleTV.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 17/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

extension AppDelegate {
    // MARK: - Apple TV
    
    func presentCurrentVC() {
        if let ew = externalWindow, let vc = currentAppleTVViewController {
            vc.view.frame = ew.frame
            UIView.transitionWithView(ew, duration: 0.8, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                ew.rootViewController = vc
            }, completion: nil)
        }
    }
    func checkAppleTVConnection() {
        let screens = UIScreen.screens()
        let screenCount = screens.count
        
        switch screenCount {
        case 1:
            self.externalWindow = nil
        case 2:
            
            // Select first external screen
            let extScreen = screens[1] as! UIScreen
            let availableModes = extScreen.availableModes
            
            let selectedRow:Int = availableModes.count - 1
            extScreen.currentMode = availableModes[selectedRow] as? UIScreenMode
            
            extScreen.overscanCompensation = UIScreenOverscanCompensation.InsetApplicationFrame
            
            if self.externalWindow == nil {
                self.externalWindow = UIWindow(frame: extScreen.bounds)
            }
            
            self.externalWindow!.screen = extScreen
            
            self.externalWindow!.makeKeyAndVisible()
            if let vc = currentAppleTVViewController {
                presentCurrentVC()
            }
            else {
                self.currentAppleTVViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVRootViewController") as? UIViewController
            }

            
        default:
            println("Couldnt handle number of screens")
        }
    }
    
    func addScreenObservers() {
        // Register for screen connect and disconnect notifications.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("checkAppleTVConnection"), name: UIScreenDidConnectNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("checkAppleTVConnection"), name: UIScreenDidDisconnectNotification, object: nil)
    }
    
    func removeScreenObservers() {
        // Register for screen connect and disconnect notifications.
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIScreenDidConnectNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIScreenDidDisconnectNotification, object: nil)
    }
}
