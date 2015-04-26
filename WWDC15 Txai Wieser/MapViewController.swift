//
//  MapViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 18/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    let wwdc = LocationPin(title: "WWDC", subtitle: "2015", coordinate: CLLocationCoordinate2D(latitude: 37.7838505, longitude: -122.4011911))
    var me:LocationPin? {
        didSet {
            self.map.addAnnotation(me)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        map.addAnnotation(wwdc)
        
        me = LocationPin(title: "Me", subtitle: "Txai Wieser", coordinate: CLLocationCoordinate2D(latitude: -29.9025772, longitude: -51.1738515))
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("focusOnMe"), userInfo: nil, repeats: false)
    }

    
    func focusOnMe() {
        if let ground = me?.coordinate {
            UIView.animateWithDuration(4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.map.setCenterCoordinate(ground, animated: false)
            }, completion: nil)
        }
        NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("focusOnWWDC"), userInfo: nil, repeats: false)
    }
    
    func focusOnWWDC() {
        let ground = wwdc.coordinate
        UIView.animateWithDuration(4.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: (UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.BeginFromCurrentState), animations: { () -> Void in
            self.map.setCenterCoordinate(ground, animated: false)
            }, completion: nil)
        NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: Selector("focusOnMe"), userInfo: nil, repeats: false)
    }

    // MARK: - Nested Type
    @objc class LocationPin:NSObject, MKAnnotation {
        var coordinate: CLLocationCoordinate2D
        var title: String
        var subtitle: String
        
        init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
            self.title = title
            self.subtitle = subtitle
            self.coordinate = coordinate
        }
    }
    
}
