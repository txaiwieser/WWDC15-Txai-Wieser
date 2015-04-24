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
            c.label.textColor = self.color
        case 2:
            switch achievement!.name {
            case "Education":
                    cell = tableView.dequeueReusableCellWithIdentifier("jobsCell") as! JobsTableViewCell
                    let ed = achievement?.from.orderedEducationalEventsArray()[indexPath.row]
                    let c = (cell as! JobsTableViewCell)
                    c.label1.text = ed?.name
                    c.label2.text = ed?.time
                    c.label3.text = ed?.about
                    c.label1.textColor = self.color
                    c.label2.textColor = self.color.colorWithAlphaComponent(0.6)
                    c.label3.textColor = self.color

            default:
                cell = tableView.dequeueReusableCellWithIdentifier("textCell") as! TextTableViewCell
                let c = (cell as! TextTableViewCell)
                c.label?.text = achievement!.longDescription
                c.label.textColor = self.color
            }
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("textCell") as! TextTableViewCell
        }
        return cell
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