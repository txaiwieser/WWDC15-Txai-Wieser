//
//  ExperimentsiOSViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 15/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class ExperimentsiOSViewController: UIViewController {
    var experimentName:String?
    var experimentDescription:String?
    var experimentImgName:String?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        descriptionLabel.text = experimentDescription
        imgView.image = UIImage(named: experimentImgName!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
