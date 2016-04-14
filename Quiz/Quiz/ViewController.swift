//
//  ViewController.swift
//  Quiz
//
//  Created by yujiikebata on 4/13/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapSystemSound(sender: AnyObject) {
        AudioServicesPlaySystemSoundWithCompletion(1000) {
            () -> Void in
            
        }
    }

    @IBAction func tabCustomSound(sender: AnyObject) {
        var soundId: SystemSoundID = 0
        if let soundUrl = NSBundle.mainBundle().URLForResource("custom", withExtension: "mp3") {
            AudioServicesCreateSystemSoundID(soundUrl, &soundId)
            AudioServicesPlaySystemSoundWithCompletion(soundId, { () -> Void in
                // some code...
            })
        }
    }
}

