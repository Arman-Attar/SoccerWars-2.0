//
//  PlayerViewModel.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import Foundation

class PlayerViewModel: ObservableObject {
    
    @Published var number = 0 // used to find the index for the card being played
    @Published private var playerCard = 0 // stores the index of the player card for that round
    @Published private var aiCard = 0 // stores the index of the ai card for that round
    @Published var aiscore = 0
    @Published var playerscore = 0
    @Published var ai = 0 // ai card deck
    @Published var player = 0 // player card deck
    @Published var dealt = 0
    @Published var tie = false
    @Published var turn = 0
    @Published var played = false
    @Published var round = 1
    let turnIndicator = ["hand.point.left", "hand.point.right"]
    
    @Published var players: [Player]
    
    init(){
        let players = PlayersDataServies.players
        self.players = players
    }
    
    func aiTurn(){
        var done: Bool = false
        while done != true{
            self.number = Int.random(in: 0...players.count - 1)
            if players[number].playerTeam == false && players[number].played == false {
                done = true
            }
        }
        aiCard = number
        players[aiCard].played = true
    }
    
    func playerTurn(){
        var done: Bool = false
        while done != true{
            self.number = Int.random(in: 0...players.count - 1)
            if players[number].playerTeam == true && players[number].played == false {
                done = true
            }
        }
        playerCard = number
        players[playerCard].played = true
    }
    
    func winner() -> Bool{
        if  players[playerCard].overall > players[aiCard].overall{
            playerscore += (1 * self.round)
            return false
            
        }
        else if players[playerCard].overall < players[aiCard].overall{
            aiscore += (1 * self.round)
            return false
        }
        else{
            
            return true
        }
    }
    
    // To randomly distribute the cards
    func randomize(){
        var i = 0
        var reset: Bool
        reset = false
        
        while reset != true{ // resets the deck to be randomized again in case the user wants to play again
            players[i].aiTeam = false
            players[i].playerTeam = false
            players[i].played = false
            i += 1
            if i == players.count {
                reset = true
            }
        }
        
        while ai < players.count / 2{
            for count in 0...players.count - 1{
                let result = Bool.random()
                if result == true && ai < players.count / 2 {
                    players[count].aiTeam = result
                    ai += 1
                }
                
            }
        }
        while player < players.count / 2{
            for count in 0...players.count - 1{
                if players[count].aiTeam == false && player < players.count / 2 {
                    players[count].playerTeam = true
                    player += 1
                }
                
            }
        }
    }
    
    func dealButton(){
        played = true
        playerTurn()
        turn = 1
        player -= 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.aiTurn()
            self.turn = 0
            self.tie = self.winner()
            if self.tie == false {
           
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    self.played = false
                    self.dealt += 1
                    self.round = 1
                }
            }
           else{
            
            self.round += 1
               self.dealt += 1
            
           }
        }
    }
        
    func reset() {
        self.playerscore = 0
        self.aiscore = 0
        self.ai = 0
        self.player = 0
        self.dealt = 0
        self.round = 1
        randomize()
    }
}
