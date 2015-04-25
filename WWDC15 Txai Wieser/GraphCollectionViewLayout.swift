//
//  GraphCollectionViewLayout.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 01/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

let personCellSize = CGSize(width: 168, height: 168)
let achievementCellSize = CGSize(width: 100, height: 100)
let eventCellSize = CGSize(width: 80, height: 80)
let backgroundCellSize = CGSize(width: 80, height: 80)
let extraCellSize = CGSize(width: 80, height: 80)
let appCellSize = CGSize(width: 70, height: 70)
let backgroundRowsQtd = 16
let backgroundRowslines = 6


class GraphCollectionViewLayout: UICollectionViewLayout {
    var collectionViewSize:CGSize {
        return self.collectionView!.frame.size
    }
    var contentSize:CGSize {
        return CGSize(width: 800, height: 900)
    }
    var center:CGPoint {
        return contentSize.center()
    }
    
    override func collectionViewContentSize() -> CGSize {
        return contentSize
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributes = [AnyObject]()
        
        let sections = self.collectionView!.numberOfSections()
        
        for i in 0 ..< sections {
            let cells = self.collectionView!.numberOfItemsInSection(i)
            
            for j in 0 ..< cells {
                let indexPath = NSIndexPath(forItem: j, inSection: i)
                attributes.append(self.layoutAttributesForItemAtIndexPath(indexPath))
            }
        }
        return attributes
    }
    
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        var attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        switch indexPath.section {
        case 0:
            attributesForPersonCell(&attributes)
        case 1:
            attributesForLifeAchievementCell(&attributes)
        case 2:
            attributesForLifeEventCell(&attributes)
        case 3:
            attributesForExtraCell(&attributes)
        case 4:
            attributesForBackgroundCell(&attributes)
        default:
            assertionFailure("No attribute for section")
        }
    
        return attributes
    }
    
    func attributesForPersonCell(inout attributes:UICollectionViewLayoutAttributes) {
        let ip = attributes.indexPath.item
        
        // zPosition
        attributes.zIndex = 100
        
        // Position
        attributes.center = center
        
        // Scale
        attributes.size = personCellSize
        
        let t = transformCenter(attributes.center)

        attributes.transform = CGAffineTransformConcat(t.0, t.1)
    }
    
    func attributesForAppCell(inout attributes:UICollectionViewLayoutAttributes) {
        let ip = attributes.indexPath
        let cellNumber = ip.item
        let cellCount = self.collectionView!.numberOfItemsInSection(ip.section)
        
        // zPosition
        attributes.zIndex = 90
        
        let pointX = (CGFloat(cellNumber) - CGFloat(cellCount)/2 + 0.5/2) * appCellSize.width + 20
        
        attributes.center = CGPoint(x: center.x + pointX, y: center.y + 320)
        
        // Size
        attributes.size = appCellSize
        
        // Scale
        let t = transform(attributes.center)
        attributes.transform = t.0
    }
    
    
    func attributesForLifeAchievementCell(inout attributes:UICollectionViewLayoutAttributes) {
        let ip = attributes.indexPath
        let cellNumber = ip.item
        let cellCount = self.collectionView!.numberOfItemsInSection(ip.section)
        
        // zPosition
        attributes.zIndex = 90
        
        
        // Randomize Parameters
        var circleRadius:CGFloat = 132
        let rangeRadius:CGFloat = 0
        let spreadVariation:Int = 1
        
        let point = spreadCirclePosition(0, number: cellNumber, of: cellCount, radius: circleRadius, range: rangeRadius, variation: spreadVariation)
        
        attributes.center = point
        
        // Size
        attributes.size = achievementCellSize
        
        // Scale
        let t = transform(attributes.center)
        attributes.transform = CGAffineTransformConcat(t.0, t.1)
        
    }
    
    func attributesForLifeEventCell(inout attributes:UICollectionViewLayoutAttributes) {
        let ip = attributes.indexPath
        let cellNumber = ip.item
        let cellCount = self.collectionView!.numberOfItemsInSection(ip.section)
        
        // zPosition
        attributes.zIndex = 0
        

        // Randomize Parameters
        var circleRadius:CGFloat = 132
        let rangeRadius:CGFloat = 0
        let spreadVariation:Int = 1
        
        let point = spreadCirclePosition(CGFloat(M_PI_4), number: cellNumber, of: cellCount, radius: circleRadius, range: rangeRadius, variation: spreadVariation)
        
        attributes.center = point
        
        // Size
        attributes.size = eventCellSize
        
        
        // Scale
        let t = transform(attributes.center)
        attributes.transform = CGAffineTransformConcat(t.0, t.1)
    }

    func attributesForExtraCell(inout attributes:UICollectionViewLayoutAttributes) {
        let ip = attributes.indexPath
        let cellNumber = ip.item
        let cellCount = self.collectionView!.numberOfItemsInSection(ip.section)
        
        // zPosition
        attributes.zIndex = 0
        
        
        // Randomize Parameters
        var circleRadius:CGFloat = 200
        let rangeRadius:CGFloat = 0
        let spreadVariation:Int = 1
        
        let point = spreadCirclePosition(CGFloat(M_PI_4)/2, number: cellNumber, of: cellCount, radius: circleRadius, range: rangeRadius, variation: spreadVariation)
        
        attributes.center = point
        
        // Size
        attributes.size = extraCellSize
        
        
        // Scale
        let t = transform(attributes.center)
        attributes.transform = CGAffineTransformConcat(t.0, t.1)
    }

    
    func attributesForBackgroundCell(inout attributes:UICollectionViewLayoutAttributes) {
        
        let ip = attributes.indexPath
        let items = self.collectionView!.numberOfItemsInSection(ip.section)
        let rowNumber = ip.item/backgroundRowsQtd
        let cellCount = ip.item - (rowNumber*backgroundRowsQtd)
        // zPosition
        attributes.zIndex = 0
        
        
        attributes.alpha = 0.52 - (CGFloat(ip.item)/CGFloat(backgroundRowsQtd))*0.04
        // Randomize Parameters
        var circleRadius:CGFloat = 282 + (CGFloat(rowNumber)*60)
        let rangeRadius:CGFloat = 0
        let spreadVariation:Int = 2
        
        let point = spreadCirclePosition(CGFloat(rowNumber)*CGFloat(M_PI_4/4), number: cellCount, of: backgroundRowsQtd, radius: circleRadius, range: rangeRadius, variation: spreadVariation)
        
        attributes.center = point
        
        // Size
        attributes.size = backgroundCellSize

        // Scale
        let t = transform(attributes.center)
        attributes.transform = CGAffineTransformConcat(t.0, t.1)

    }
    
    
    
    func transform(itemCenter:CGPoint) -> (CGAffineTransform, CGAffineTransform)  {
        let of = self.collectionView!.contentOffset - (itemCenter - self.collectionView!.bounds.size/2)
        let absOffset = of.length()
        let fixSizeRadius:CGFloat = 100
        let exp = absOffset < fixSizeRadius ? 0.0 : (absOffset - fixSizeRadius)/80.0;
        var scale = pow(0.5, exp)
        if (scale < 0.1) {
            scale = 0.1
        }
        
        
        let scaleTr = CGAffineTransformMakeScale(scale, scale)
        let transTr = CGAffineTransformMakeTranslation((scale - 1)*of.x/4, (scale - 1)*of.y/4)
//        return CGAffineTransformMakeScale(1, 1)
//        return scaleTr
        return (scaleTr, transTr)
    }
    
    func transformCenter(itemCenter:CGPoint) -> (CGAffineTransform, CGAffineTransform)  {
        let of = self.collectionView!.contentOffset - (itemCenter - self.collectionView!.bounds.size/2)
        let absOffset = of.length()
        let fixSizeRadius:CGFloat = 100
        let exp = absOffset < fixSizeRadius ? 0.0 : (absOffset - fixSizeRadius)/80.0;
        var scale = pow(0.8, exp)
        if (scale < 0.1) {
            scale = 0.1
        }
        
        
        let scaleTr = CGAffineTransformMakeScale(scale, scale)
        let transTr = CGAffineTransformMakeTranslation((scale - 1)*of.x/4, (scale - 1)*of.y/4)
        //        return CGAffineTransformMakeScale(1, 1)
        //        return scaleTr
        return (scaleTr, transTr)
    }
    
    func spreadCirclePosition(initialAngle:CGFloat, number:Int, of max:Int, radius:CGFloat, range:CGFloat, variation:Int) -> CGPoint {
        // To get a random feeling but still get the same value for every position i'm using PI digits!
        let mod = pow(10, CGFloat(number*variation))
        let randomNumber = CGFloat(M_PI)*mod
        let random10 = Int(randomNumber%10)
        let random1 = CGFloat(random10)/10
        
        let randomizedRadius:CGFloat = range*random1 - range/2
        
        let circleRadius = radius+randomizedRadius
        
        // Position
        
        let anglePos = CGFloat(number)/CGFloat(max)*CGFloat(2*M_PI) + initialAngle
        let circleX = center.x+(circleRadius)*cos(anglePos)
        let circleY = center.y+(circleRadius)*sin(anglePos)
        
        return CGPoint(x: circleX, y: circleY)
    }
}
