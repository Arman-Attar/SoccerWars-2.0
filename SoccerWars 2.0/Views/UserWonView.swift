//
//  UserWonView.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-07.
//

import SwiftUI

struct UserWonView: View {
    @EnvironmentObject var vm:PlayerViewModel
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle().ignoresSafeArea().background(Color(.black)).opacity(0.4)
               userWonView
            }
        }
    }
}


struct UserWonView_Previews: PreviewProvider {
    static var previews: some View {
        UserWonView()
            .environmentObject(PlayerViewModel())
    }
}

extension UserWonView {
    
    private var mainMenu: some View {
        NavigationLink(
            destination: Menu(rule: RuleViewModel())){
                Text("Return to Main Menu")
                    .font(.headline)
                    .foregroundColor(Color.yellow)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 50)
                    .background(Color(.black))
                    .cornerRadius(15)
            }.environmentObject(PlayerViewModel())
    }
    
    private var playAgain: some View {
        Button {
            vm.reset()
        } label: {
            Text("Play Again")
                .font(.headline)
                .foregroundColor(Color.yellow)
                .padding(.vertical, 30)
                .padding(.horizontal, 50)
                .background(Color(.black))
                .cornerRadius(15)
        }
    }
    
    private var userWonView: some View {
            VStack{
                HStack{
                    Image(systemName: "crown").font(.system(size: 50)).foregroundColor(.yellow)
                    Text("You won")
                        .font(.largeTitle)
                        .fontWeight(.medium).foregroundColor(.yellow)
                    Image(systemName: "crown").font(.system(size: 50)).foregroundColor(.yellow)
                }
                playAgain
                mainMenu
            }
    }
}
