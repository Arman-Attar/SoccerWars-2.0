//
//  RulesDataServices.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import Foundation
import SwiftUI

class RuleDataServices {
    static let rules: [ruleSet] = [
        
        ruleSet(ruleText: "The overall War mode puts the player against the AI where they take turns playing a random card from their deck.", imageName: "deck", backgroundColor: Color.blue),
        ruleSet(ruleText: "The player with the highest overall card played during that round wins.", imageName: "arrow", backgroundColor: Color.red),
        ruleSet(ruleText: "In the case of a draw the players keep playing until a winner for that round is determined.", imageName: "tie", backgroundColor: Color.yellow),
        ruleSet(ruleText: "Game is over when players run out of cards", imageName: "loser", backgroundColor: Color.green)
    ]
}

