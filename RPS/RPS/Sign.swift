//
//  Sign.swift
//  RPS
//
//  Created by Maxime Mallet on 06/07/2022.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📄"
        case .scissors:
            return "✂️"
        }
    }
    
    func winsAgainst(thisSign enemySign: Sign) -> GameState {
        switch (self, enemySign) {
        case (.rock, .rock),
            (.paper, .paper),
            (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
            (.paper, .rock),
            (.scissors, .paper):
            return .win
        case (.rock, .paper),
            (.paper, .scissors),
            (.scissors, .rock):
            return .lose
        }
    }
}
