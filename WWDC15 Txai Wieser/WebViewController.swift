//
//  WebViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var link:String? {
        didSet {
            if let l = link, let url = NSURL(string: l) {
                if self.webview != nil {
                    self.webview.loadRequest(NSURLRequest(URL: url))
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        if let l = link, let url = NSURL(string: l) {
            self.webview.loadRequest(NSURLRequest(URL: url))
        }
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
