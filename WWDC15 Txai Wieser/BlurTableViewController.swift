//
//  BlurTableViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 04/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class BlurTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        self.tableView.backgroundView = UIVisualEffectView(effect: effect)
        self.tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: effect)
        self.tableView.tableFooterView = UIView()
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: tableView.frame.size.width, height: 22)))
        v.backgroundColor = UIColor.clearColor()
        return v
    }
    
}
