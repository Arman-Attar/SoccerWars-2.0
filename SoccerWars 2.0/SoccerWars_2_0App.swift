//
//  SoccerWars_2_0App.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import SwiftUI

@main
struct SoccerWars_2_0App: App {
    
   @StateObject private var playerVM = PlayerViewModel()
    
    var body: some Scene {
        WindowGroup {
            Menu(rule: RuleViewModel())
               .environmentObject(PlayerViewModel())
        }
    }
}
