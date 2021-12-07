//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var answerBtn1: UIButton!
    @IBOutlet weak var answerBtn2: UIButton!
    @IBOutlet weak var answerBtn3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!

    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        //change color on asnwering
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //Adding delay
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    @objc func updateUI(){
        //update score
        scoreLable.text = "Score: \(quizBrain.getScore()) / \(quizBrain.quiz.count)"
        
        //update progress
        progressBar.progress = quizBrain.getProgress()
        
        //updating question text
        questionLable.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getOptions()
        answerBtn1.setTitle(answerChoices[0], for: .normal)
        answerBtn2.setTitle(answerChoices[1], for: .normal)
        answerBtn3.setTitle(answerChoices[2], for: .normal)
        
        
        //clearing color
        answerBtn1.backgroundColor = UIColor.clear
        answerBtn2.backgroundColor = UIColor.clear
        answerBtn3.backgroundColor = UIColor.clear
    }
}

