//
//  LifeEventCollectionViewCell.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 01/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

@IBDesignable
class LifeEventCollectionViewCell: UICollectionViewCell {
    var item:Int = 0 {
        didSet {
            self.backgroundColor = UIColor.newWWDCtertiary((item == 0 ? 1 : 2*item+1))
            self.tintColor = self.backgroundColor
        }
    }
    var lifeEvent:Event? {
        didSet {
            if let event = lifeEvent {
                configure(event)
            }
        }
    }
    
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
        self.backgroundColor = UIColor.california()
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.myWhite().CGColor
        self.layer.cornerRadius = eventCellSize.radius()
        
        if let event = lifeEvent {
            configure(event)
        }
    }
    
    func configure(event:Event) {
        iconImageView.image = UIImage(named: event.iconName)
        iconImageView.tintColor = UIColor.whiteColor()
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
