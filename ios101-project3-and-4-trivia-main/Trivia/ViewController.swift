//
//  ViewController.swift
//  Trivia
//
//  Created by Yu-Shan Cheng on 7/1/25.
//

import UIKit
struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
}
class ViewController: UIViewController {
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    
    var questions: [Question] = [
        Question(text: "What is 2 + 2?", answers: ["3", "4", "5", "6"], correctAnswer: "4"),
        Question(text: "Capital of France?", answers: ["Berlin", "Paris", "Madrid", "Rome"], correctAnswer: "Paris"),
        Question(text: "Sky color?", answers: ["Blue", "Red", "Yellow", "Green"], correctAnswer: "Blue")
    ]
    
    var currentIndex = 0
    var correctAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    func showQuestion() {
        let q = questions[currentIndex]
        questionLabel.text = q.text
        answerButton1.setTitle(q.answers[0], for: .normal)
        answerButton2.setTitle(q.answers[1], for: .normal)
        answerButton3.setTitle(q.answers[2], for: .normal)
        answerButton4.setTitle(q.answers[3], for: .normal)
        
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        guard currentIndex < questions.count else { return }
        
        if sender.currentTitle == questions[currentIndex].correctAnswer {
            correctAnswers += 1
        }
        
        currentIndex += 1
        
        if currentIndex < questions.count {
            showQuestion()
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentIndex = 0
        correctAnswers = 0
        
        // Optional: Fetch new questions from API
        // Or reuse existing ones
        showQuestion()
    }
}
    


