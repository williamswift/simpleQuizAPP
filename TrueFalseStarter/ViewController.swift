//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = trivia.count
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0
    

    // All interactive elements
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var AnswerAButton: UIButton!
    @IBOutlet weak var AnswerBButton: UIButton!
    @IBOutlet weak var AnswerCButton: UIButton!
    @IBOutlet weak var AnswerDButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        let triviaQuestions = trivia[indexOfSelectedQuestion]
        // questionField.Text needs to be the questions from the trivia array
        questionField.text = triviaQuestions.question
        AnswerAButton.setTitle(triviaQuestions.optionA, for: .normal)
        AnswerBButton.setTitle(triviaQuestions.optionB, for: .normal)
        AnswerCButton.setTitle(triviaQuestions.optionC, for: .normal)
        AnswerDButton.setTitle(triviaQuestions.optionD, for: .normal)
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        AnswerAButton.isHidden = true
        AnswerBButton.isHidden = true
        AnswerCButton.isHidden = true
        AnswerDButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = trivia
        
        if (sender === AnswerAButton &&  correctAnswer == "A") || (sender === AnswerBButton && correctAnswer == trivia.) || (sender === AnswerCButton &&  correctAnswer == "C") || (sender === AnswerDButton &&  correctAnswer == "D")  {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        AnswerAButton.isHidden = false
        AnswerBButton.isHidden = false
        AnswerCButton.isHidden = false
        AnswerDButton.isHidden = false
        
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

