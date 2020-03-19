//
//  ViewController.swift
//  Quiz
//
//  Created by CSUFTitan on 2/9/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    let questions: [String] = [
               "What is 7+7?",
               "What is the capital of Vermont?",
               "What is cognac made from?"
           ]
           let answers: [String] = [
               "14",
               "Montpelier",
               "Grapes"
           ]
           var currentQuestionIndex: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad(animated)
        
        questionLabel.alpha = 0
    }
    override func viewDidLoad() {
           super.viewDidLoad()
           questionLabel.text = questions[currentQuestionIndex]
       }
    func animationLabelTransitions(){
        let animationClosure = {() -> Void in
            self.questionLabel.alpha = 1
        }
        UIView.animate(withDuration: 0.5, animations: animationClosure)
    }
}

