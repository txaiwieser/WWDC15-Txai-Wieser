//
//  LifeEventCollectionViewCell.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 01/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

@IBDesignable
class ExtrasCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    
    var segueName:String?
    var name:String?
    var item = 0 {
        didSet {
            self.backgroundColor = UIColor.WWDCsecondary(item)
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
        self.backgroundColor = UIColor.brownColor()
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.myWhite().CGColor
        self.layer.cornerRadius = extraCellSize.radius()
    }
        
    
    
    
    
    
    
    
    
    
    
    var animating = false
    
    
    
    
    
    func scaleUp(by amount:CGFloat, from cFrame:CGRect) {
        let cSize = cFrame.size*2
        let cPos = cFrame.origin - (cSize - cFrame.size)/2
        
        if !animating {
            animating = true
            UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.frame = CGRect(origin: cPos, size: cSize)
                }, completion: { (completion) -> Void in
                    self.animating = false
            })
        }
    }
    
    func scaleDown(from cFrame:CGRect) {
        let cSize = cFrame.size
        let cPos = cFrame.origin
        
        
        if !animating {
            animating = true
            UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.frame = CGRect(origin: cPos, size: cSize)
                }, completion: { (completion) -> Void in
                    self.animating = false
            })
        }
    }
    
    
}
