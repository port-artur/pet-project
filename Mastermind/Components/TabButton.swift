//
//  TabBatton.swift
//  Mastermind
//
//  Created by 🌚🌚 Царь🌚🌚 on 05.05.2022.
//

import SwiftUI

struct TabButton: View {
    
    var title: String
    var animation: Namespace.ID

    
    @Binding var currentTab: String
    
    var body: some View {
        
        Button(){
            withAnimation(.spring()){
                
                currentTab = title
            }
        } label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white: .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(
                    
                    ZStack{
                        if currentTab == title  {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    
                )
        }
        
        
    }
    
}
