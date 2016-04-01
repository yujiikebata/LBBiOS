//
//  ViewController.swift
//  MyCalc
//
//  Created by yujiikebata on 4/1/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Tap number button
    @IBAction func tap1Button(sender: AnyObject) {
        let value = priceField.text! + "1"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap2Button(sender: AnyObject) {
        let value = priceField.text! + "2"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap3Button(sender: AnyObject) {
        let value = priceField.text! + "3"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap4Button(sender: AnyObject) {
        let value = priceField.text! + "4"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap5Button(sender: AnyObject) {
        let value = priceField.text! + "5"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap6Button(sender: AnyObject) {
        let value = priceField.text! + "6"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap7Button(sender: AnyObject) {
        let value = priceField.text! + "7"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap8Button(sender: AnyObject) {
        let value = priceField.text! + "8"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap9Button(sender: AnyObject) {
        let value = priceField.text! + "9"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap0Button(sender: AnyObject) {
        let value = priceField.text! + "0"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap00Button(sender: AnyObject) {
        let value = priceField.text! + "00"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    
    // Tap clear button
    @IBAction func tapClearButton(sender: AnyObject) {
        priceField.text = "0"
    }
}

