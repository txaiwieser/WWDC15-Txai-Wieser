//
//  SocialViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {
    var website: String?
    var email: String?
    var facebook: String?
    var twitter: String?
    
    weak var appleTVInterface:WebViewController?
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        emailButton.setTitle(email, forState: UIControlState.Normal)
        facebookButton.setTitle(facebook, forState: UIControlState.Normal)
        twitterButton.setTitle(twitter, forState: UIControlState.Normal)
        websiteButton.setTitle(website, forState: UIControlState.Normal)
        updateAppleTV()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateAppleTV() {
        var vc:WebViewController? = appleTVInterface
        if vc == nil {
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WebViewController") as! WebViewController?
            appleTVInterface = vc
        }
        vc!.link = website
        AppDelegate.$.currentAppleTVViewController = vc
    }

    @IBAction func websiteButton(sender: UIButton) {
        appleTVInterface?.link = website
    }
    
    @IBAction func emailButton(sender: UIButton) {
    }
    
    @IBAction func facebookButton(sender: UIButton) {
        appleTVInterface?.link = facebook
    }

    @IBAction func twitterButton(sender: UIButton) {
        appleTVInterface?.link = twitter
    }
}
