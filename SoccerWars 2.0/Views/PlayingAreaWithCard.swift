//
//  PlayingAreaWithCard.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-07.
//

import SwiftUI

struct PlayingAreaWithCard: View {
    
    @EnvironmentObject var vm: PlayerViewModel
    
    var body: some View {
        playArea
    }
}

struct PlayingAreaWithCard_Previews: PreviewProvider {
    static var previews: some View {
        PlayingAreaWithCard()
            .environmentObject(PlayerViewModel())
    }
}

extension PlayingAreaWithCard{
    private var playArea: some View {
        HStack {
            if vm.played == true{
                Image(vm.players[vm.number].name).resizable().frame(width: 250, height: 380)
                    .cornerRadius(30)
                    .shadow(radius: 20)
                    .padding()
            }
            else{
                Rectangle().frame(width: 250, height: 380)
                    .cornerRadius(30)
                    .shadow(radius: 20)
                    .padding()
                    .opacity(0)
            }
        }
    }
}
