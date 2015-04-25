//
//  AchievementCollectionViewCell.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 14/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

@IBDesignable
class AchievementCollectionViewCell: UICollectionViewCell {
    var item:Int = 0 {
        didSet {
            cellRepresentation.backgroundColor = UIColor.newWWDCtertiary((item == 0 ? 0 : 2*item))
            self.tintColor = cellRepresentation.backgroundColor
        }
    }
    var achievement:Achievement? {
        didSet {
            if let achi = achievement {
                configure(achi)
            }
        }
    }
    var cellRepresentation:UIView!
    
    @IBOutlet weak var iconImageView: UIImageView!
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

        cellRepresentation = UIView(frame: CGRect(origin: CGPoint(size: achievementCellSize*0.1), size: achievementCellSize*0.8))
        cellRepresentation.backgroundColor = UIColor.scarlet()
        cellRepresentation.layer.borderWidth = 0
        cellRepresentation.layer.borderColor = UIColor.myWhite().CGColor
        cellRepresentation.layer.cornerRadius = achievementCellSize.radius()*0.4
        cellRepresentation.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        
        self.backgroundView = UIView()
        self.backgroundView!.addSubview(cellRepresentation)
        
        if let achi = achievement {
            configure(achi)
        }
    }
    
    func configure(achiev:Achievement) {
        iconImageView.image = UIImage(named: achiev.iconName)
        iconImageView.tintColor = UIColor.whiteColor()
    }
}
