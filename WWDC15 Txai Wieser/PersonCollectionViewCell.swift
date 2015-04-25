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
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!

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
        v.backgroundColor = UIColor.personBlue()
        v.alpha = 0.5
        v.layer.borderWidth = 0
        v.layer.borderColor = UIColor.blackColor().CGColor
        v.layer.cornerRadius = personCellSize.radius()*0.4
        v.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
        
        let j = UIView(frame: CGRect(origin: CGPoint(size: personCellSize*0.1), size: personCellSize*0.8))
        j.backgroundColor = UIColor.personBlue()
        j.alpha = v.alpha
        j.layer.borderWidth = v.layer.borderWidth
        j.layer.borderColor = v.layer.borderColor
        j.layer.cornerRadius = v.layer.cornerRadius
        self.tintColor = UIColor.personBlue()
        
        let a = UIView()
        a.addSubview(v)
        a.addSubview(j)
        self.backgroundView = a
    }
}
