//
//  NameMode.swift
//  Mastermind
//
//  Created by 🌚🌚 Царь🌚🌚 on 05.05.2022.
//

import SwiftUI

struct NameMode: View {
    @State var nameMode: String = ""
    var body: some View {
        Text(nameMode)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.black)
            .padding(.bottom, 10)
            .fixedSize(horizontal: false, vertical: true)
    }
}
