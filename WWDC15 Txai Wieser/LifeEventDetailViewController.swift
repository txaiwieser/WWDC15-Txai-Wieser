//
//  LifeEventDetailViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class LifeEventDetailViewController: BluredViewController, UITableViewDataSource, UITableViewDelegate {
    weak var event:Event?
    var color:UIColor = UIColor.whiteColor()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Dark)

        tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: effect)
        tableView.tableFooterView = UIView()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateAppleTV()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var number = 1
        if let ev = event {
            if let s = ev.smallDescription where s != "" {
                number++
            }
            var ld = 0
            if let s = ev.longDescription1 where s != "" {
                ld = 1
            }
            if let s = ev.longDescription2 where s != "" {
                ld = 1
            }
            if let s = ev.longDescription3 where s != "" {
                ld = 1
            }
            var ap = 0
            if ev.name == "Projects" && ev.from.myApps.count > 0 {
                ap = 1
            }
            number += ld+ap
        }
        return number
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = 1
        
        if let ev = event {
            if ev.name == "Projects" && (section == 2 || section == 3) {
                number = ev.from.myApps.count
            }
            else if section == 2 {
                number = 0
                if let s = ev.longDescription1 where s != "" {
                    number++
                }
                if let s = ev.longDescription2 where s != "" {
                    number++
                }
                if let s = ev.longDescription3 where s != "" {
                    number++
                }
            }
        }
        return number
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("imageCell") as! ImageTableViewCell
            let c = (cell as! ImageTableViewCell)
            c.imgView.image = UIImage(named: event!.iconName)
            c.imgView.image = c.imgView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            c.imgView.tintColor = self.color

        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("titleCell") as! TitleTableViewCell
            let c = (cell as! TitleTableViewCell)
            c.label.text = event?.smallDescription
            
        case 2:
            if event?.name == "Projects" {
                cell = tableView.dequeueReusableCellWithIdentifier("appCell") as! AppTableViewCell
                (cell as! AppTableViewCell).app = event?.from.orderedAppsArray()[indexPath.row]
            }
            else {
                fallthrough
            }
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("textCell") as! TextTableViewCell
            let c = (cell as! TextTableViewCell)
            switch indexPath.row {
            case 2:
                c.textView?.text = event!.longDescription3!
            case 1:
                c.textView?.text = event!.longDescription2!
            default:
                c.textView?.text = event!.longDescription1!
            }
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
    
    func updateAppleTV() {
        if let vc = AppDelegate.$.currentAppleTVViewController as? AppleTVLifeGraphMatchingViewController {
            vc.iconImageNames = [event!.iconName]
        }
        else {
            let appleTVInterface = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVGraphView") as! AppleTVLifeGraphMatchingViewController
            appleTVInterface.iconImageNames = [event!.iconName]
            AppDelegate.$.currentAppleTVViewController = appleTVInterface
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? AppDetailTableViewController {
            vc.app = (sender as! AppTableViewCell).app
        }
    }
    
    @IBAction func dismissModal() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}