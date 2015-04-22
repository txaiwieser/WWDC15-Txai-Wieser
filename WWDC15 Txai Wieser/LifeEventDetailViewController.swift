//
//  LifeEventDetailViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class LifeEventDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    weak var event:Event?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.view = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension

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
            (cell as! ImageTableViewCell).imgView.image = UIImage(named: event!.iconName)
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("titleCell") as! TitleTableViewCell
            (cell as! TitleTableViewCell).label?.text = event?.smallDescription
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
            switch indexPath.row {
            case 2:
                (cell as! TextTableViewCell).label?.text = "\n" + event!.longDescription3!
            case 1:
                (cell as! TextTableViewCell).label?.text = "\n" + event!.longDescription2! + "\n"
            default:
                (cell as! TextTableViewCell).label?.text = event!.longDescription1! + "\n"
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
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