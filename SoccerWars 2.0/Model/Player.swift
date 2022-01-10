//
//  Player.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    
    let id = UUID().uuidString
    let name: String
    let overall: Int
    var aiTeam: Bool
    var playerTeam: Bool
    var played: Bool
}


