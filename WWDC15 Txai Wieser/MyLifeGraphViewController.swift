//
//  MyLifeGraphViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 01/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import CoreData

class MyLifeGraphViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var person:Person? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var isPresentingModal = false
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        var err: NSErrorPointer = nil
        let appDelegate = AppDelegate.$
        let managedObjectContext: NSManagedObjectContext! = appDelegate.managedObjectContext
        let model: NSManagedObjectModel = appDelegate.managedObjectModel
        let fetchRequest = model.fetchRequestTemplateForName("PersonTxai")!
        var result: NSArray! = managedObjectContext.executeFetchRequest(fetchRequest, error: err)
        
        person = result.firstObject as? Person
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.isPresentingModal = false
        self.setNeedsStatusBarAppearanceUpdate()
        updateAppleTV()
        let frameSize = self.collectionView.frame.size
        let centerPosition = self.collectionView.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))!.center
        
        self.collectionView.scrollRectToVisible(CGRect(origin: centerPosition - frameSize/2, size: self.collectionView.frame.size), animated: true)
    }
    
    func updateAppleTV() {
        let appleTVInterface = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AppleTVGraphView") as! UIViewController
        AppDelegate.$.currentAppleTVViewController = appleTVInterface
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let controller = (segue.destinationViewController as? UIViewController)
        controller?.modalPresentationStyle = .OverFullScreen
        
        if let myVc = controller as? PersonDetailViewController {
            myVc.person = person
        }
        else if let myVc = controller as? LifeEventDetailViewController, let cell = sender as? LifeEventCollectionViewCell {
            myVc.event = cell.lifeEvent
        }
        else if let myVc = controller as? ExperimentsiOSViewController, let cell = sender as? ExtrasCollectionViewCell {
            myVc.experimentName = cell.name
        }
        
        self.isPresentingModal = true
    }
    
    
    @IBAction func dismissAnyModel() {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.isPresentingModal = false
        self.setNeedsStatusBarAppearanceUpdate()
        updateAppleTV()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        if self.isPresentingModal {
            return UIStatusBarStyle.LightContent
        }
        else {
            return UIStatusBarStyle.Default
        }
    }

    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }
    
    
    // MARK: - UICollectionView Data Source

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        if let c = cell as? ExtrasCollectionViewCell {
            self.performSegueWithIdentifier(c.segueName, sender: cell)
        }
    }
    
    var animating = false
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        let cFrame = collectionView.collectionViewLayout.layoutAttributesForItemAtIndexPath(indexPath).frame

        if let c = cell as? LifeEventCollectionViewCell {
            c.scaleUp(by: 1.6, from: cFrame)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        let cFrame = collectionView.collectionViewLayout.layoutAttributesForItemAtIndexPath(indexPath).frame
        
        if let c = cell as? LifeEventCollectionViewCell {
            c.scaleDown(from: cFrame)
        }
        
        
    }
    
    // MARK: - UICollectionView Data Source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let p = person {
            switch section {
            case 0:
                return 1
            case 1:
                return p.lifeAchievements.count
            case 2:
                return p.lifeEvents.count
            case 3:
                return p.extraInfos.count
            case 4:
                return 2*backgroundRowslines*backgroundRowsQtd
            default:
                assertionFailure("No itens on Section")
                return 0
            }
        }
        else { return 0 }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! PersonCollectionViewCell
        case 1:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("AchievementCell", forIndexPath: indexPath) as! AchievementCollectionViewCell
            let a = person?.orderedAchievementsArray()[indexPath.item]
            (cell as! AchievementCollectionViewCell).achievement = a
            (cell as! AchievementCollectionViewCell).item = indexPath.item

        case 2:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("LifeEventCell", forIndexPath: indexPath) as! LifeEventCollectionViewCell
            let e = person?.orderedEventsArray()[indexPath.item]
            (cell as! LifeEventCollectionViewCell).lifeEvent = e
            (cell as! LifeEventCollectionViewCell).item = indexPath.item

        case 3:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("ExtraCell", forIndexPath: indexPath) as! ExtrasCollectionViewCell
            let a = person?.orderedExtraInfosArray()[indexPath.item]
            (cell as! ExtrasCollectionViewCell).segueName = a?.segueID
            (cell as! ExtrasCollectionViewCell).item = indexPath.item
        case 4:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("BackgroundCell", forIndexPath: indexPath) as! BackgroundCollectionViewCell
            (cell as! BackgroundCollectionViewCell).item = indexPath.item
        default:
            assertionFailure("No cell for section")
            cell = UICollectionViewCell()
        }
        
        return cell
    }
}
