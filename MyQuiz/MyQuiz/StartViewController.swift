//
//  StartViewController.swift
//  MyQuiz
//
//  Created by yujiikebata on 5/7/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        QuestionDataManager.sharedInstance.loadQuestion()
        
        if let newxtViewController = segue.destinationViewController as? QuestionViewController {
            if let questionData = QuestionDataManager.sharedInstance.nextQuestion() {
                newxtViewController.questionData = questionData
            }
        }
    }
    
    @IBAction func goToTitle(segue: UIStoryboardSegue) {
        
    }
}