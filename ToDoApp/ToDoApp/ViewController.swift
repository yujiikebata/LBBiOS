//
//  ViewController.swift
//  ToDoApp
//
//  Created by yujiikebata on 4/3/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var todoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load user data
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let storedTodoList = userDefaults.arrayForKey("todoList") as? [String] {
            todoList.appendContentsOf(storedTodoList)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapAddButton(sender: AnyObject) {
        let alertController = UIAlertController(title: "TODO追加",
                                                message: "TODOを入力してください",
                                                preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler(nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction) -> Void in
            if let textField = alertController.textFields?.first {
                self.todoList.insert(textField.text!, atIndex: 0)
                
                self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Right)
                
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(self.todoList, forKey: "todoList")
                userDefaults.synchronize()
            }
        }
        
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath)
        let todoTitle = todoList[indexPath.row]
        cell.textLabel!.text = todoTitle
        return cell
    }
}

