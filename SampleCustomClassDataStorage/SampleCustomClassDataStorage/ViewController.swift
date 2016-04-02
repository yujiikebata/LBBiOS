//
//  ViewController.swift
//  SampleCustomClassDataStorage
//
//  Created by yujiikebata on 4/2/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set text
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let data = MyData()
        data.valueString = "test"
        
        // serialize
        let archiveData = NSKeyedArchiver.archivedDataWithRootObject(data)
        userDefaults.setObject(archiveData, forKey: "data")
        userDefaults.synchronize()
        
        // deserialize
        if let storedData = userDefaults.objectForKey("data") as? NSData {
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as? MyData {
                if let valueString = unarchivedData.valueString {
                    print("deserialized data: " + valueString)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

