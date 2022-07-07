//
//  ViewController.swift
//  RPS
//
//  Created by Maxime Mallet on 06/07/2022.
//

import UIKit

var state: GameState = .start

class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var enemySign: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI(currentState: state)
    }

    @IBAction func clickOnRock(_ sender: UIButton) {
        if state == .start {
            play(sign: .rock)
        }
    }
    
    @IBAction func clickOnPaper(_ sender: UIButton) {
        if state == .start {
            play(sign: .paper)
        }
    }
    
    @IBAction func clickOnScissors(_ sender: UIButton) {
        if state == .start {
            play(sign: .scissors)
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        state = .start
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        
        updateUI(currentState: state)
    }

    func updateUI(currentState: GameState) {
        gameStatus.text = currentState.message
        appSign.text = currentState.mainEmote
        
        switch state {
        case .start:
            view.backgroundColor = UIColor.white
            playAgainButton.isHidden = true
            enemySign.isHidden = true
        case .win:
            view.backgroundColor = UIColor.yellow
            playAgainButton.isHidden = false
            enemySign.isHidden = false
        case .lose:
            view.backgroundColor = UIColor.blue
            playAgainButton.isHidden = false
            enemySign.isHidden = false
        case .draw:
            view.backgroundColor = UIColor.gray
            playAgainButton.isHidden = false
            enemySign.isHidden = false
        }
    }
    
    func play(sign: Sign) {
        let botSign: Sign = randomSign()
        state = sign.winsAgainst(thisSign: botSign)
        enemySign.text = "Enemy's sign : \(botSign.emoji)"

        switch sign {
        case .rock:
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            paperButton.isHidden = true
            rockButton.isHidden = true
        }
        
        updateUI(currentState: state)
    }

}

