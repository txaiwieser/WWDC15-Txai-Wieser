//
//  PersonDetailPageViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 18/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class ExtraInfoViewController: BluredViewController {
    @IBOutlet weak var label: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    weak var extraContent:ExtraInfo?
    var color:UIColor = UIColor.whiteColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        titleLabel.text = extraContent!.name
        imgView.image = UIImage(named: extraContent!.iconName)
        label.text = extraContent!.about
        updateAppleTV()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateAppleTV() {
        if let name = extraContent?.name {
            switch name {
            case "Brazil":
                
            let appleTVInterface = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVMapViewController") as! MapViewController
            AppDelegate.$.currentAppleTVViewController = appleTVInterface
            default:
                println(":)")
            }
        }
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
