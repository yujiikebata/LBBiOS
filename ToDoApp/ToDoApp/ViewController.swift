//
//  ViewController.swift
//  ToDoApp
//
//  Created by yujiikebata on 4/3/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var todoList = [MyTodo]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load user data
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let todoListData = userDefaults.objectForKey("todoList") as? NSData {
            if let storedTodoList = NSKeyedUnarchiver.unarchiveObjectWithData(todoListData) as? [MyTodo] {
                todoList.appendContentsOf(storedTodoList)
            }
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
                let myTodo = MyTodo()
                myTodo.todoTitle = textField.text
                self.todoList.insert(myTodo, atIndex: 0)
                
                self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Right)
                
                let data: NSData = NSKeyedArchiver.archivedDataWithRootObject(self.todoList);
                
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(data, forKey: "todoList")
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
        let todo = todoList[indexPath.row]
        cell.textLabel!.text = todo.todoTitle
        if todo.todoDone {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo = todoList[indexPath.row]
        if todo.todoDone {
            todo.todoDone = false
        } else {
            todo.todoDone = true
        }
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade);
        
        let data: NSData = NSKeyedArchiver.archivedDataWithRootObject(todoList)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(data, forKey: "todoList")
        userDefaults.synchronize()
    }
    
    class MyTodo: NSObject, NSCoding {
        var todoTitle: String?
        var todoDone: Bool = false
        
        override init() {
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            todoTitle = aDecoder.decodeObjectForKey("todoTitle") as? String
            todoDone = aDecoder.decodeBoolForKey("todoDone")
        }
        
        func encodeWithCoder(aCoder: NSCoder) {
            aCoder.encodeObject(todoTitle, forKey: "todoTitle")
            aCoder.encodeBool(todoDone, forKey: "todoDone")
        }
    }
}

