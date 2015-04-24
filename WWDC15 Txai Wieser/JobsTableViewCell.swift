//
//  JobsTableViewCell.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 24/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import UIKit

class JobsTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}