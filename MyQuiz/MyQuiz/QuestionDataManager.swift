//
//  QuestionDataManager.swift
//  MyQuiz
//
//  Created by yujiikebata on 5/2/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import Foundation

class QuestionData {
    // csv
    var question: String?
    var answer1: String?
    var answer2: String?
    var answer3: String?
    var answer4: String?
    var correctAnswerNumber: Int
    
    // user
    var userChoiceAnswerNumber: Int?
    var questionNo: Int = 0
    
    // initializer
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        correctAnswerNumber = Int(questionSourceDataArray[5])!
    }
    
    func isCorrect() -> Bool {
        if correctAnswerNumber == userChoiceAnswerNumber {
            return true
        }
        
        return false
    }
}