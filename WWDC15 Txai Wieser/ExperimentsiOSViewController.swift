//
//  ExperimentsiOSViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 15/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class ExperimentsiOSViewController: BluredViewController {
    var experiment:ExtraInfo?
    var color:UIColor = UIColor.whiteColor()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        titleLabel.text = experiment!.name
        descriptionLabel.text = experiment!.about
        imgView.image = UIImage(named: experiment!.iconName)
        
        
//        titleLabel.textColor = self.color
//        descriptionLabel.textColor = self.color
//        imgView.image = imgView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
//        imgView.tintColor = self.color

        
        updateAppleTV(experiment!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func updateAppleTV(xp:ExtraInfo) {
        let appleTVInterface = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVViewController") as! ExperimentsAppleTVViewController
        if xp.name == "Veins" {
            appleTVInterface.experiment = 2
        }
        else {
            appleTVInterface.experiment = 1
        }
        AppDelegate.$.currentAppleTVViewController = appleTVInterface
    }

}
