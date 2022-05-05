//
//  ContentView.swift
//  Mastermind
//
//  Created by 🌚🌚 Царь🌚🌚 on 12.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showeMoadal = false
    @State var text = "Режим игры"
    var body: some View {
        ZStack{
            Image("bg4")
                .resizable()
                .ignoresSafeArea()
            
            HStack(spacing: 0) {
                
                
                Button(action: { showeMoadal = true }) {
                    Text(text)
                }
                
                
                
            }.font(.system(size: 25, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 20)
                .padding(.horizontal, 80)
                .background(Color.black.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
                .offset(y: -320)
            
            ModalView(isShowing: $showeMoadal, textButton: $text)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
