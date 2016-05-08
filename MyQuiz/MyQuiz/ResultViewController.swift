//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by yujiikebata on 5/8/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var correctPercentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        var correctCount: Int = 0
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect() {
                correctCount += 1
            }
        }
        let correctPercent: Float = (Float(correctCount) / Float(questionCount)) * 100
        correctPercentLabel.text = String(format: "%.01f", correctPercent) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
