//
//  ModeDescription.swift
//  Mastermind
//
//  Created by 🌚🌚 Царь🌚🌚 on 05.05.2022.
//

import SwiftUI

struct ModeDescription: View {
    @State var DescriptionText: String = ""
    var body: some View {
        Text(DescriptionText)
            .foregroundColor(.black)
            .font(.system(size: 25, weight: .regular))
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.bottom, 10)
    }
}
