//
//  AppleTVLifeGraphMatchingViewController.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 25/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import UIKit

class AppleTVLifeGraphMatchingViewController: UIViewController {

    @IBOutlet var iconsImageViews: [UIImageView]!
    
    var iconImageNames:[String]? {
        didSet { if isViewLoaded() { reloadIcons() } } }
    var selectedIndex:Int = 0 {
        didSet {
            if selectedIndex < iconsImageViews.count {
                iconsImageViews[oldValue].alpha = 1
                iconsImageViews[selectedIndex].alpha = 0.2
            }
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reloadIcons()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadIcons() {
        if let imgNames = iconImageNames {
            if imgNames.count == 1 {
                iconImageView.image = UIImage(named: imgNames[0])
                
                UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    self.iconImageView.alpha = 1
                    self.nameLabel.alpha = 0
                    for imgV in self.iconsImageViews {
                        imgV.alpha = 0
                    }
                    }, completion: nil)
            }
            else if imgNames.count > 1 {
                for (i, imgV) in enumerate(self.iconsImageViews) {
                    imgV.image = UIImage(named: imgNames[i])
                    if i == 0 { imgV.alpha = 0.2 }
                }
                UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    self.iconImageView.alpha = 0
                    self.nameLabel.alpha = 0
                    for imgV in self.iconsImageViews {
                        imgV.alpha = 1
                    }
                    }, completion: nil)
            }
        }
        else {
            UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.iconImageView.alpha = 0
                self.nameLabel.alpha = 1
                for imgV in self.iconsImageViews {
                    imgV.alpha = 0
                }
                }, completion: nil)
        }
    }
    
    func updateBackgroundWith(angle:CGFloat) {
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.imageView.transform = CGAffineTransformMakeRotation(angle)
        })

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
