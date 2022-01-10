//
//  Menu.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import SwiftUI

struct Menu: View {
    
    @ObservedObject var rule: RuleViewModel
    @EnvironmentObject var players: PlayerViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("back").resizable().ignoresSafeArea()
                    VStack{
                      header
                       Spacer()
                        NavigationLink(
                            destination: Play() ) {playButton}
                        Spacer().frame(height: 30)
                        NavigationLink(
                            destination: Rules(ruleVM: RuleViewModel()) ) {ruleButton}
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height / 3)
                    }
            }
        }
        .navigationBarHidden(true)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(rule: RuleViewModel())
            .environmentObject(PlayerViewModel())
    }
}

extension Menu {
    
    private var header: some View {
        HStack{
            Image(systemName: "chevron.up").font(.system(size: 45)).foregroundColor(.black)
            
            Text("Soccer Wars").font(.system(size: 40)).bold().foregroundColor(.black)
            
            Image(systemName: "chevron.down").font(.system(size: 45)).foregroundColor(.black)
            
        }
        .padding()
        .shadow(radius: 10)
    }
    
    private var playButton: some View{
        Text("Play")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 250)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 10)
    }
    
    private var ruleButton: some View{
        Text("Rules")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 250)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(radius: 10)
    }
}
