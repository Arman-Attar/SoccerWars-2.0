//
//  Rules.swift
//  SoccerWars 2.0
//
//  Created by Arman Zadeh-Attar on 2022-01-06.
//

import SwiftUI

struct Rules: View {
    
    @ObservedObject var ruleVM: RuleViewModel
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            //Color.black.ignoresSafeArea()
            Image("back").resizable().ignoresSafeArea()
            TabView{
                slideContent
            }.tabViewStyle(PageTabViewStyle()).background(.ultraThinMaterial)
        }
    }
}

struct Rules_Previews: PreviewProvider {
    static var previews: some View {
        Rules(ruleVM: RuleViewModel())
    }
}

extension Rules {
    private var slideContent: some View{
        ForEach(ruleVM.rules) { rule in
            VStack{
                Spacer()
                Image(rule.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                    .padding()
                    .background(rule.backgroundColor)
                    .clipShape(Circle())
                    .overlay(Circle()
                                .stroke(Color.white, lineWidth: 10))
                    .shadow(color: rule.backgroundColor, radius: 20)
                    
                Spacer()
                Text(rule.ruleText)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                    .frame(height:100)
            }
            .padding()
            
        }
    }
}
