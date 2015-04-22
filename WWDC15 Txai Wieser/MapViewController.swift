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
    
    let transitionTime:NSTimeInterval = 16
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        map.addAnnotation(wwdc)
        
        me = LocationPin(title: "Me", subtitle: "Txai Wieser", coordinate: CLLocationCoordinate2D(latitude: -29.9025772, longitude: -51.1738515))
        
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("focusOnMe"), userInfo: nil, repeats: false)
    }

    
    func focusOnMe() {
        if let ground = me?.coordinate {
            let p = MKMapPointForCoordinate(ground)
            let r = MKMapRect(origin: p, size: MKMapSize(width: 0, height: 0))
            map.setVisibleMapRect(r, animated: true)
        }
        NSTimer.scheduledTimerWithTimeInterval(transitionTime+5, target: self, selector: Selector("focusOnWWDC"), userInfo: nil, repeats: false)
    }
    
    func focusOnWWDC() {
        let ground = wwdc.coordinate
        let p = MKMapPointForCoordinate(ground)
        let r = MKMapRect(origin: p, size: MKMapSize(width: 0, height: 0))
        map.setVisibleMapRect(r, animated: true)

        NSTimer.scheduledTimerWithTimeInterval(transitionTime+4, target: self, selector: Selector("focusOnMe"), userInfo: nil, repeats: false)
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
