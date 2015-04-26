//
//  AppImageViewerViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 17/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {
    var imagesName:[String]?
    @IBOutlet weak var scrollView: UIScrollView!
    
    var page:Int = 1
    var photosCount:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        configureScrollView()
    }
    
    func configureScrollView() {
        scrollView.alpha = 0
        if let imgNames = imagesName {
            var images = [UIImageView]()
            for (index, img) in enumerate(imgNames) {
                let iv = UIImageView(frame: self.scrollView.frame)
                iv.contentMode = UIViewContentMode.ScaleAspectFit
                iv.image = UIImage(named: img)
                
                iv.frame.origin.x = self.scrollView.frame.size.width*CGFloat(index)
                self.scrollView.addSubview(iv)
                images.append(iv)
            }
            
            self.photosCount = images.count
            self.scrollView.contentSize = self.scrollView.frame.size * CGSize(width: images.count, height: 1)
            self.scrollView.scrollRectToVisible(CGRect(origin: CGPointZero, size: self.scrollView.frame.size), animated: true)
            NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("nextPhoto"), userInfo: nil, repeats: true)
        }
        
        UIView.animateWithDuration(1, animations: { [weak scrollView] () -> Void in
            scrollView?.alpha = 1
        })
    }
    

    
    func nextPhoto() {
        page = (page < photosCount ? ++page : 1)
        
        self.scrollView.scrollRectToVisible(CGRect(origin: CGPoint(x: CGFloat(page-1)*self.scrollView.frame.size.width, y: 0), size: self.scrollView.frame.size), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
