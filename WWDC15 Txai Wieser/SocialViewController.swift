//
//  SocialViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var website: String?
    var email: String?
    var facebook: String?
    var twitter: String?
    
    var color:UIColor = UIColor.whiteColor()
    
    weak var appleTVInterface:WebViewController?
    
    @IBOutlet weak var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        contactTableView.dataSource = self
        contactTableView.delegate = self
        contactTableView.estimatedRowHeight = 81
        contactTableView.rowHeight = UITableViewAutomaticDimension
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        contactTableView.separatorEffect = UIVibrancyEffect(forBlurEffect: effect)

    }

    override func viewWillAppear(animated: Bool) {
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

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
            
        }
        else {
            appleTVInterface?.link = (tableView.cellForRowAtIndexPath(indexPath) as! ContactTableViewCell).label.text
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("contactCell") as! ContactTableViewCell
        cell.label.textColor = self.color
        cell.icon.image = cell.icon.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        cell.icon.tintColor = self.color

        
        switch indexPath.row {
        case 0:
            cell.icon.image = UIImage(named: "website")
            cell.label.text = website
            cell.selected = true
        case 1:
            cell.icon.image = UIImage(named: "email")
            cell.label.text = email
        case 2:
            cell.icon.image = UIImage(named: "facebook")
            cell.label.text = facebook
        case 3:
            cell.icon.image = UIImage(named: "twitter")
            cell.label.text = twitter
        default:
            cell.label.text = "Not Found"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Remove seperator inset
        cell.separatorInset = UIEdgeInsetsZero
        // Prevent the cell from inheriting the Table View's margin settings
        cell.preservesSuperviewLayoutMargins = false
        // Explictly set your cell's layout margins
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
}
