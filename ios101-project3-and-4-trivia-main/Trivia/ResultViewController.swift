//
//  ResultViewController.swift
//  Trivia
//
//  Created by Yu-Shan Cheng on 7/1/25.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int = 0
    var total: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You got \(score) out of \(total) correct!"
    }

    @IBAction func playAgainTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
