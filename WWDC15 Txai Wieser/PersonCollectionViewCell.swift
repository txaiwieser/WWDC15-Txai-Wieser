//
//  PersonCollectionViewCell.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 02/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

@IBDesignable
class PersonCollectionViewCell: UICollectionViewCell {
    var item:Int = 0
    
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
    
        let v = UIView(frame: CGRect(origin: CGPoint(size: personCellSize*0.1), size: personCellSize*0.8))
        v.backgroundColor = UIColor.darkBlue()
        v.alpha = 0.6
        v.layer.borderWidth = 0
        v.layer.borderColor = UIColor.blackColor().CGColor
        v.layer.cornerRadius = personCellSize.radius()*0.4
        v.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        
        let j = UIView(frame: CGRect(origin: CGPoint(size: personCellSize*0.1), size: personCellSize*0.8))
        j.backgroundColor = UIColor.darkBlue()
        j.alpha = v.alpha
        j.layer.borderWidth = v.layer.borderWidth
        j.layer.borderColor = v.layer.borderColor
        j.layer.cornerRadius = v.layer.cornerRadius
        
        let a = UIView()
        a.addSubview(v)
        a.addSubview(j)
        self.backgroundView = a
    }
}
