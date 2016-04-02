//
//  ViewController.swift
//  SampleDataStorage
//
//  Created by yujiikebata on 4/2/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // retrieve stored text
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let value = userDefaults.stringForKey("text") {
            // set it
            textField.text = value
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapActionButton(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(textField.text, forKey: "text")
        userDefaults.synchronize()
    }
}

