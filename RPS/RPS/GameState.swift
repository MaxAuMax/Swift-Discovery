//
//  GameState.swift
//  RPS
//
//  Created by Maxime Mallet on 06/07/2022.
//

import Foundation
import UIKit

enum GameState {
    case start, win, lose, draw
    
    var message: String {
        switch self {
        case .start:
            return "Welcome to Rock, Paper, Scissors! Choose your sign :"
        case .win:
            return "Congratulations! You just won the game!"
        case .lose:
            return "Aww too bad... Better luck next time!"
        case .draw:
            return "Ouch! It's a draw. Try again."
        }
    }
    
    var mainEmote: String {
        switch self {
        case .start:
            return "🤖"
        case .win:
            return "🏆"
        case .lose:
            return "😭"
        case .draw:
            return "🤷"
        }
    }
    
}
