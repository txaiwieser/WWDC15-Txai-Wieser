//
//  AppTableViewCell.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 21/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    weak var app:App? {
        didSet {
            if let a = app {
                self.appIcon.image = UIImage(named: a.appIconName)
                self.appNameLabel.text = a.appName
            }
        }
    }
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
