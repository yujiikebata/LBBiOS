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

class QuestionDataManager {
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [QuestionData]()
    var nowQuestionIndex: Int = 0
    
    private init() {
        
    }
    
    func loadQuestion() {
        questionDataArray.removeAll()
        nowQuestionIndex = 0
        
        if let csvFilePath = NSBundle.mainBundle().pathForResource("question", ofType: "csv") {
            do {
                if let csvStringData: String = try String(contentsOfFile: csvFilePath, encoding: NSUTF8StringEncoding) {
                        csvStringData.enumerateLines({ (line, stop) -> () in
                            let questionSourceDataArray = line.componentsSeparatedByString(",")
                            let questionData = QuestionData(questionSourceDataArray: questionSourceDataArray)
                            self.questionDataArray.append(questionData)
                            questionData.questionNo = self.questionDataArray.count
                    })
                }
            } catch let error {
                print(error)
            }
        }
    }
        
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
}
