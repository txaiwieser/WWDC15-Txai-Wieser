//
//  PersonPageViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 18/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class PersonDetailViewController: BluredViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)

    weak var person:Person? {
        didSet {
            if let p = person {
                reloadPageView(p)
            }
        }
    }
    
    var color:UIColor = UIColor.whiteColor() {
        didSet {
            color = color.darkerColor(nil)
        }
    }
    
    var myViewControllers = [UIViewController]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        self.pageViewController.view.frame = self.view.bounds
        self.addChildViewController(pageViewController)
        self.view.insertSubview(pageViewController.view, atIndex: 2)
        
        self.view.backgroundColor = UIColor.clearColor()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateAppleTV()
    }
    func reloadPageView(p:Person) {
        
        for (index, screen) in enumerate(p.orderedScreenInfosArray()) {
            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("Person1ID") as! PersonDetailPageViewController
            vc.view.frame = self.view.bounds
            vc.view.backgroundColor = UIColor.clearColor()
            vc.text = screen.text
            vc.image = UIImage(named: screen.iconName)
            vc.color = self.color
            vc.item = index
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
    
    func updateAppleTV() {
        if let vc = AppDelegate.$.currentAppleTVViewController as? AppleTVLifeGraphMatchingViewController {
            let nms = person?.orderedScreenInfosArray().map { $0.iconName }
            vc.iconImageNames = nms
        }
        else {
            let appleTVInterface = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVGraphView") as! AppleTVLifeGraphMatchingViewController
            let nms = person?.orderedScreenInfosArray().map { $0.iconName }
            appleTVInterface.iconImageNames = nms
            AppDelegate.$.currentAppleTVViewController = appleTVInterface
        }
    }
}
