//
//  RuleSet.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import Foundation
import SwiftUI

struct ruleSet: Identifiable {
    let id: String = UUID().uuidString
    let ruleText: String
    let imageName: String
    let backgroundColor: Color
}
