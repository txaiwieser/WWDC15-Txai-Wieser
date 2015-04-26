//
//  WebViewController.swift
//  WWDC 2015 - Txai Wieser
//
//  Created by Txai Wieser on 19/04/15.
//  Copyright (c) 2015 Txai Wieser. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    var link:String? {
        didSet {
            if let l = link {
                load(l)
            }
        }
    }
    func load(var link:String) {
//        self.webview?.layer.removeAllAnimations()
//        self.webview?.scrollView.contentOffset = CGPointZero
        if !link.hasPrefix("http") { link = "http://" + link }
        if let url = NSURL(string: link) {
            if self.webview != nil {
                let rq = NSURLRequest(URL: url)
                self.webview.loadRequest(rq)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        if let l = link {
            load(l)
        }
    }
    
//    func webViewDidFinishLoad(webView: UIWebView) {
//        let bottomOffset = CGPoint(x: 0, y: webView.scrollView.contentSize.height - webView.scrollView.bounds.size.height)
//        UIView.animateWithDuration(18, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            webView.scrollView.contentOffset = bottomOffset
//        }, completion: nil)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
