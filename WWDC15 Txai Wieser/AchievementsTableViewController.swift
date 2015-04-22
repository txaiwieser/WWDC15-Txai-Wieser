//
//  AchievementsTableViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 15/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class AchievementsTableViewController: BlurTableViewController {
    weak var achievement:Achievement?
    
    @IBOutlet weak var firstCellContentView: UIView!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
        if let achiev = achievement {
            updateDetailsOn(achiev)
        }
    }

    func updateDetailsOn(a:Achievement) {
        self.title = a.name
        self.img.image = UIImage(named: a.iconName)
    }

}
