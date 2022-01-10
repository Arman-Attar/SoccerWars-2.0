//
//  RuleViewModel.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import Foundation

class RuleViewModel: ObservableObject {
    
   @Published var rules: [ruleSet]
    
    init(){
        let rules = RuleDataServices.rules
        self.rules = rules
    }
    
}
