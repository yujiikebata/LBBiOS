//
//  MyData.swift
//  SampleCustomClassDataStorage
//
//  Created by yujiikebata on 4/2/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import Foundation

class MyData :NSObject, NSCoding {
    
    var valueString: String?
    
    override init() {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(valueString, forKey: "valueString")
    }
    
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObjectForKey("valueString") as? String
    }
}