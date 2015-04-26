//
//  LifeEventDetailViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class AchievementDetailViewController: BluredViewController, UITableViewDataSource, UITableViewDelegate {
    weak var achievement:Achievement?
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateAppleTV()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var number = 2
        if let ach = achievement {
            number += 1
        }
        return number
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = 1
        
        if let ach = achievement {
            switch ach.name {
            case "Education":
                if section == 2 {
                    number = ach.from.educationalEvents.count
                }
            default:
                if section == 2 {
                    number = 1
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
            c.imgView.image = UIImage(named: achievement!.iconName)
            c.imgView.image = c.imgView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            c.imgView.tintColor = self.color

            
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("titleCell") as! TitleTableViewCell
            let c = (cell as! TitleTableViewCell)
            c.label?.text = achievement!.name
        case 2:
            switch achievement!.name {
            case "Education":
                    cell = tableView.dequeueReusableCellWithIdentifier("jobsCell") as! JobsTableViewCell
                    let ed = achievement?.from.orderedEducationalEventsArray()[indexPath.row]
                    let c = (cell as! JobsTableViewCell)
                    c.label1.text = ed?.name
                    c.label2.text = ed?.time
                    c.label3.text = ed?.about

            default:
                cell = tableView.dequeueReusableCellWithIdentifier("textCell") as! TextTableViewCell
                let c = (cell as! TextTableViewCell)
                c.label?.text = achievement!.longDescription
            }
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("textCell") as! TextTableViewCell
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? AppDetailTableViewController {
            vc.app = (sender as! AppTableViewCell).app
        }
    }
    
    func updateAppleTV() {
        if let vc = AppDelegate.$.currentAppleTVViewController as? AppleTVLifeGraphMatchingViewController {
            vc.iconImageNames = [achievement!.iconName]
        }
        else {
            let appleTVInterface = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVGraphView") as! AppleTVLifeGraphMatchingViewController
            appleTVInterface.iconImageNames = [achievement!.iconName]
            AppDelegate.$.currentAppleTVViewController = appleTVInterface
        }
    }
    
    @IBAction func dismissModal() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}