//
//  PersonPageViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 18/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)

    weak var person:Person? {
        didSet {
            if let p = person {
                reloadPageView(p)
            }
        }
    }
    
    var color:UIColor = UIColor.whiteColor()
    
    var myViewControllers = [UIViewController]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        self.addChildViewController(pageViewController)
        self.view.insertSubview(pageViewController.view, atIndex: 0)
        
        self.view.backgroundColor = UIColor.clearColor()
        
        
        let effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.view.frame
        
        self.view.insertSubview(effectView, atIndex: 0)
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    func reloadPageView(p:Person) {
        
        for screen in p.orderedScreenInfosArray() {
            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("Person1ID") as! PersonDetailPageViewController
            vc.text = screen.text
            vc.image = UIImage(named: screen.iconName)
            vc.color = self.color
            let array = Array(screen.images) as! [Image]
            vc.imagesName = array.map { $0.imgName }
            myViewControllers.append(vc)
        }

        let vc1 = self.storyboard!.instantiateViewControllerWithIdentifier("SocialViewController") as! SocialViewController
        vc1.email = p.email
        vc1.facebook = p.facebook
        vc1.twitter = p.twitter
        vc1.website = p.website
        vc1.color = self.color
        myViewControllers.append(vc1)
        
        
        if myViewControllers.count > 0 {
            self.pageViewController.setViewControllers([myViewControllers[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = Int(find(myViewControllers, viewController)!)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return myViewControllers[index]
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = Int(find(myViewControllers, viewController)!)
        
        if (index == NSNotFound) {
            return nil
        }
        
        index++
        if index == myViewControllers.count {
            return nil
        }
        return myViewControllers[index]
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return myViewControllers.count
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}