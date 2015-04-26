//
//  MovieViewController.swift
//  WWDC15 Txai Wieser
//
//  Created by Txai Wieser on 26/04/15.
//  Copyright (c) 2015 TDW. All rights reserved.
//

import UIKit
import MediaPlayer

class MovieViewController: UIViewController {
    var moviePlayer : MPMoviePlayerController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func playVideo(named:String) {
        let path = NSBundle.mainBundle().pathForResource(named, ofType:"mov")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            player.prepareToPlay()
            player.scalingMode = MPMovieScalingMode.AspectFit
            self.view.addSubview(player.view)

            player.view.setTranslatesAutoresizingMaskIntoConstraints(false)

            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: ["subview":player.view]))
                
            self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: ["subview":player.view]))
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let mp = moviePlayer {
            mp.play()
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
