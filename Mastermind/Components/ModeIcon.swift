//
//  ModeIcon.swift
//  Mastermind
//
//  Created by 🌚🌚 Царь🌚🌚 on 05.05.2022.
//

import SwiftUI
struct ModeIcon: View {
    @State var iconName: String = ""
    
    var body: some View {
        Image(systemName: iconName)
            .font(.system(size: 56.0))
            .padding(.bottom, 10)
            .foregroundColor(.black)
    }
}
