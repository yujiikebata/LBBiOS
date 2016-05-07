//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by yujiikebata on 5/7/16.
//  Copyright © 2016 yujiikebata. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {
    
    var questionData: QuestionData!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, forState: UIControlState.Normal)
        answer2Button.setTitle(questionData.answer2, forState: UIControlState.Normal)
        answer3Button.setTitle(questionData.answer3, forState: UIControlState.Normal)
        answer4Button.setTitle(questionData.answer4, forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAnswer1Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer2Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer3Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer4Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }

    func goNextQuestionWithAnimation() {
        if questionData.isCorrect() {
            goNextQuestionWithCorrectAnimation()
        } else {
            goNextQuestionWithIncorrectAnimation()
        }
    }
    
    func goNextQuestionWithCorrectAnimation() {
        AudioServicesPlayAlertSoundWithCompletion(1025, nil)
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.correctImageView.alpha = 1.0
            }, completion: { (Bool) -> Void in
                self.goNextQuestion()
        })
    }
    
    func goNextQuestionWithIncorrectAnimation() {
        AudioServicesPlayAlertSoundWithCompletion(1026, nil)
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.incorrectImageView.alpha = 1.0
            }, completion: { (Bool) -> Void in
                self.goNextQuestion()
        })
    }
    
    func goNextQuestion() {
        if let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion() {
            if let nextQuestionViewController = storyboard?.instantiateViewControllerWithIdentifier("question") as? QuestionViewController {
                nextQuestionViewController.questionData = nextQuestion
                self.presentViewController(nextQuestionViewController, animated: true, completion: nil)
            }
        } else {
            if let resultViewController = storyboard?.instantiateViewControllerWithIdentifier("result") as? ResultViewController {
                self.presentViewController(resultViewController, animated: true, completion: nil)
            }
        }
    }
}