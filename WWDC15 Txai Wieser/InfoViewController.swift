//
//  InfoViewController.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 23/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import UIKit

class InfoViewController: BluredViewController {

    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        icon.image = icon.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        icon.tintColor = text1.textColor
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
