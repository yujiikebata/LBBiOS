//
//  ViewController.swift
//  Animation
//
//  Created by yujiikebata on 4/17/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func tapStartButton(sender: AnyObject) {
        let animation = CABasicAnimation(keyPath: "cornerRaius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        animation.fromValue = 0
        animation.toValue = 20
        animation.duration = 1
        
        targetView.layer.addAnimation(animation, forKey: "cornerRadius")
        targetView.layer.cornerRadius = 20
    }
}

