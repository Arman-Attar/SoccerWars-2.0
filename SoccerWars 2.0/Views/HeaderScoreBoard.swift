//
//  HeaderScoreBoard.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-07.
//

import SwiftUI

struct HeaderScoreBoard: View {
    @EnvironmentObject var vm: PlayerViewModel
    
    var body: some View {
        VStack{
        scoreBoard
        cardLeftBar
        }
    }
}

struct HeaderScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        HeaderScoreBoard()
            .environmentObject(PlayerViewModel())
    }
}

extension HeaderScoreBoard {
    private var scoreBoard: some View {
        HStack{
            Label("User: \(vm.playerscore) ", systemImage: "person.circle.fill")
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .background(Color(.black))
                .cornerRadius(20)
            
            Image(systemName: vm.turnIndicator[vm.turn]).font(.system(size: 40)).foregroundColor(.white)
            
            
            Label("CPU: \(vm.aiscore) ", systemImage: "desktopcomputer").padding(.vertical, 10)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .background(Color(.black))
                .cornerRadius(20)
            
            
        }.padding()
    }
    
    private var cardLeftBar: some View{
        
        Label("User cards left:  \(vm.player) ", systemImage: "placeholdertext.fill").padding(.vertical, 10)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            .background(Color(.black))
            .cornerRadius(20)
    }
}
