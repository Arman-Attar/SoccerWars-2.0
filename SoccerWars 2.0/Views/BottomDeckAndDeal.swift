//
//  BottomDeckAndDeal.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-07.
//

import SwiftUI

struct BottomDeckAndDeal: View {
    @EnvironmentObject var vm: PlayerViewModel
    
    var body: some View {
        VStack(spacing: 20){
            DealButton
            userDeckView
        }
    }
}

struct BottomDeckAndDeal_Previews: PreviewProvider {
    static var previews: some View {
        BottomDeckAndDeal()
            .environmentObject(PlayerViewModel())
    }
}

extension BottomDeckAndDeal {
    private var DealButton: some View{
            Button(action: {
                vm.dealButton()
            }, label: {
                Text("Deal").bold().padding(.vertical, 20.0).padding([.leading, .trailing], 50.0).background(Color(.black).opacity(0.8)).foregroundColor(.white).cornerRadius(25)
                    .offset(y: -20)
            })
    }
    
    private var userDeckView: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(0..<vm.players.count) { card in
                    if vm.players[card].playerTeam == true && vm.players[card].played == false{
                        Image(vm.players[card].name).resizable().frame(width: 100, height: 150).aspectRatio(contentMode: .fill).cornerRadius(20).shadow(radius: 5)
                    }
                }
            }
            
        }.padding(.horizontal, 10)
    }
    
}
