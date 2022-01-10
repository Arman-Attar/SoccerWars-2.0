//
//  Play.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import SwiftUI

struct Play: View {
    
    @EnvironmentObject var vm: PlayerViewModel
    
    var body: some View {
            ZStack{
                Color.black.ignoresSafeArea()
                Image("field")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                VStack{
                    HeaderScoreBoard()
                    Spacer()
                    PlayingAreaWithCard().padding()
                    Spacer()
                    BottomDeckAndDeal()
                }
                if vm.aiscore < vm.playerscore && vm.dealt == 10 {
                    UserWonView()
                }
                else if vm.playerscore < vm.aiscore && vm.dealt == 10 {
                    UserLostView()
                }
                else if vm.playerscore == vm.aiscore && vm.dealt == 10 {
                    DrawView()
                }
            }.navigationBarHidden(true).onAppear {
                vm.reset()
            }
        
    }
}

struct Play_Previews: PreviewProvider {
    static var previews: some View {
        Play()
            .environmentObject(PlayerViewModel())
    }
}
