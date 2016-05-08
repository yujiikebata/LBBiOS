//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

// Enable asynchronous connection
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// Create Request
let session = NSURLSession.sharedSession()
let url = NSURL(string: "http:www.yahoo.com")!
let request = NSURLRequest(URL: url)
let task = session.dataTaskWithRequest(request) {
    (data: NSData?, response:NSURLResponse?, error: NSError?) -> Void in
    if let data = data {
        let value = NSString(data: data, encoding: NSUTF8StringEncoding)
        print(value)
    }
}

// Execute
task.resume()