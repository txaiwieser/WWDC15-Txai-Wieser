//
//  RecolorindooReinoTableViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 06/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class AppDetailTableViewController: UITableViewController {
    weak var app:App?
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appDescription: UITextView!
    @IBOutlet weak var downloadAppStore: UIButton!
    
    
    lazy var appBackground:UIImageView = {
        let v = UIImageView(frame: self.view.frame)
        v.contentMode = UIViewContentMode.ScaleAspectFill
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        //
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.tableView.frame
        self.tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: effect)
        
        let bg = UIView(frame: self.tableView.frame)
        self.tableView.backgroundView = bg
        bg.addSubview(appBackground)
        bg.addSubview(effectView)

        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(animated: Bool) {
        if let p = app {
            updateDetailsOn(p)
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: tableView.frame.size.width, height: 22)))
        v.backgroundColor = UIColor.clearColor()
        return v
    }
    
    
    func updateDetailsOn(p:App) {
        self.appName.text = p.appName
        self.appIcon.image = UIImage(named: p.appIconName)
        self.appDescription.text = p.appDescription
        self.appBackground.image = UIImage(named: p.backgroundImageName)
        if !p.available {
            self.downloadAppStore.setImage(UIImage(named: "soon_AppStore"), forState: UIControlState.Normal)
        }
        updateAppleTV(p)
        recalibrateParallax()
    }
    
    func updateAppleTV(p:App) {
        let appleTVInterface = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVImageViewer") as! ImageViewerViewController
        let array = Array(p.images) as! [Image]
        appleTVInterface.imagesName = array.map { $0.imgName }
            AppDelegate.$.currentAppleTVViewController = appleTVInterface
    }
    
    @IBAction func downloadOnAppStore(sender: UIButton) {
        if let application = app where application.available == true {
            if let url = NSURL(string: "itms-apps://itunes.apple.com/app/" + application.appID) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        recalibrateParallax()
    }
    
    func recalibrateParallax() {
        
        if let bgImg = self.appBackground.image {
            let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
                type: .TiltAlongHorizontalAxis)
            
            let s = bgImg.size
            let horizontal = s.width-self.appBackground.frame.width
            
            horizontalMotionEffect.minimumRelativeValue = -horizontal/2
            horizontalMotionEffect.maximumRelativeValue = horizontal/2
            
            let group = UIMotionEffectGroup()
            group.motionEffects = [horizontalMotionEffect]
            
            if let mfxs = self.appBackground.motionEffects {
                for me in mfxs {
                    self.appBackground.removeMotionEffect(me as! UIMotionEffect)
                }
            }
            self.appBackground.addMotionEffect(group)
        }
    }
}
