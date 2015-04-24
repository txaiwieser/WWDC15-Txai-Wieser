//
//  BackgroundCollectionViewCell.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 01/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

@IBDesignable
class BackgroundCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    var item:Int = 0 {
        didSet {
            let name = "cellIcon_" + String(self.item%19)
            self.iconImageView.image = UIImage(named: name)
            self.backgroundColor = UIColor.WWDCtertiary(item)
            self.tintColor = self.backgroundColor
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
        initialize()
    }
    
    func initialize() {
        self.backgroundColor = UIColor.blackColor()
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.myWhite().CGColor
        self.layer.cornerRadius = backgroundCellSize.radius()
    }
    
}
