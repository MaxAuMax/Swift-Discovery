//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Maxime Mallet on 07/07/2022.
//

import UIKit

enum Mode {
    case flashCards, quiz
}

enum State {
    case question, answer, score
}

class ViewController: UIViewController, UITextFieldDelegate {

    var mode: Mode = .flashCards {
        didSet {
            switch mode {
            case .flashCards:
                setupFlashCards()
            case .quiz:
                setupQuiz()
            }
            updateUI()
        }
    }
    
    var state: State = .question
    
    let fixedElementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var elementList : [String] = []
    var currentElementIndex = 0
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .flashCards
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        state = .answer
        
        updateUI()
    }

    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
            if mode == .quiz {
                state = .score
                updateUI()
                return
            }
        }
        state = .question
        
        updateUI()
    }
    
    @IBAction func switchMods(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0 {
            mode = .flashCards
        } else {
            mode = .quiz
        }
    }
    
    /// Updates the app's UI based on its mode and state
    func updateUI() {
        // Shared code: updating the image
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        
        // Mode-specific UI updates are split into two methods for readability
        switch mode {
        case .flashCards:
            updateFlashCardUI(elementName: elementName)
        case .quiz:
            updateQuizUI(elementName: elementName)
        }
    }
    
    /// Updates the app's UI in Flash Cards mode
    func updateFlashCardUI(elementName: String) {
        // Text field and keyboard
        textField.isHidden = true
        textField.resignFirstResponder()
        
        // Answer label
        if state == .answer {
            answerLabel.text = elementName
        } else {
            answerLabel.text = "?"
        }
        
        // Segmented Control
        modeSelector.selectedSegmentIndex = 0
        
        // Buttons
        showAnswerButton.isHidden = false
        nextButton.isEnabled = true
        nextButton.setTitle("Next Element", for: .normal)
    }
    
    /// Updates the app's UI in Quiz mode
    func updateQuizUI(elementName: String) {
        // Text field and keyboard
        textField.isHidden = false
        switch state {
            case .question:
            textField.isEnabled = true
                textField.text = ""
                textField.becomeFirstResponder()
        case .answer:
            textField.isEnabled = false
            textField.resignFirstResponder()
        case .score:
            textField.isHidden = true
            textField.resignFirstResponder()
        }
        
        //Answer label
        switch state {
        case .question:
            answerLabel.text = ""
        case .answer:
            if answerIsCorrect {
                answerLabel.text = "Correct !"
            } else {
                answerLabel.text = "❌\nCorrect Answer : \(elementName)"
            }
        case .score:
            answerLabel.text = ""
        }
        
        if state == .score {
            displayScoreAlert()
        }
        
        // Segmented Control
        modeSelector.selectedSegmentIndex = 1
        
        // Buttons
        showAnswerButton.isHidden = true
        if currentElementIndex == elementList.count - 1 {
            nextButton.setTitle("Show Score", for: .normal)
        } else {
            nextButton.setTitle("Next Question", for: .normal)
        }
        switch state {
        case .question:
            nextButton.isEnabled = false
        case .answer:
            nextButton.isEnabled = true
        case .score:
            nextButton.isEnabled = false
        }
    }
    
    /// Runs after the user press Return Key on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Get the text from the text field
        let textFieldContents = textField.text!

        // Determine whether the user answered correctly and update appropriate quiz state
        if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased() {
            answerIsCorrect = true
            correctAnswerCount += 1
        } else {
            answerIsCorrect = false
        }

        // The app should now display the answer to the user
        state = .answer
        
        updateUI()
        
        return true
    }
    
    /// Shows an iOS alert with the user's quiz score.
    func displayScoreAlert() {
        let alert = UIAlertController(title: "Quiz Score", message: "Your score is \(correctAnswerCount) out of \(elementList.count).", preferredStyle: .alert)
    
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:))
        alert.addAction(dismissAction)
    
        present(alert, animated: true, completion: nil)
    }
    
    func scoreAlertDismissed(_ action: UIAlertAction) {
        mode = .flashCards
    }
    
    /// Sets up a new Flash Cards session
    func setupFlashCards() {
        state = .question
        currentElementIndex = 0
        elementList = fixedElementList
    }
    
    /// Sets up a new Quiz
    func setupQuiz() {
        state = .question
        currentElementIndex = 0
        answerIsCorrect = false
        correctAnswerCount = 0
        elementList = fixedElementList.shuffled()
    }
    
}

