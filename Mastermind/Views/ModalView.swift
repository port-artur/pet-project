//
//  ModalView.swift
//  Mastermind
//
//  Created by 🌚🌚 Царь🌚🌚 on 12.03.2022.
//

import SwiftUI

struct ModalView: View {
    @Binding var isShowing: Bool
    @Binding var textButton: String
    @State private var showeMoadal = false
    @State private var isDragging = false
    @State private var curHeight: CGFloat = 580
    @State var currentTab = "Slide"
    @Namespace var animation
    let minHeight: CGFloat = 570
    let maxHeight: CGFloat = 700
    
    let startOpacity: Double = 0.4
    let endOpacity: Double = 0.8
    
    @State var decoderMode = "Режим где игрок загадывает число, а система пытается отгадать придуманное число, за наименьшее количество ходов."
    @State var pvpMode = "Режим где оба игрока загадывают число, игрок отгадавший придуманное число быстрее соперника, побеждает."
    @State var pveMode = "Режим где система загадывает число, а игроки пытаетются отгадать придуманное число, кто из игроков догадается быстрее тот и побелил."
    @State var encoderMode = "Режим где система загадывает число, а игрок пытается отгадать."
    @State var defaultDescriptionMode = "После выбора режима игры, вы сможете увидеть по нему, всю необходимую информацию"
    
    @State var nameMode1 = "Decoder"
    @State var nameMode2 = "PvP"
    @State var nameMode3 = "PvE"
    @State var nameMode4 = "Encoder"
    @State var nameModeDefault = "C уважением(разработчик/студия)"
    
    
    var dragPercentage: Double {
        let result = Double((curHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, result))
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(Animation.easeInOut(duration: 0.2))
        
    }
    
    var mainView: some View {
        VStack{
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
                    .foregroundColor(.black)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
            ZStack(){
                VStack{
                    switch currentTab {
                    case "Decoder" :
                        ModeIcon(iconName: "rectangle.and.pencil.and.ellipsis")
                        ModeDescription(DescriptionText: "\(decoderMode)")
                    case "PvP" :
                        ModeIcon(iconName: "brain")
                        ModeDescription(DescriptionText: "\(pvpMode)")
                    case "PvE" :
                        ModeIcon(iconName: "person.badge.clock")
                        ModeDescription(DescriptionText: "\(pveMode)")
                    case "Encoder" :
                        ModeIcon(iconName: "keyboard")
                        ModeDescription(DescriptionText: "\(encoderMode)")
                    default:
                        ModeIcon(iconName: "questionmark.circle")
                        ModeDescription(DescriptionText: "\(defaultDescriptionMode)")
                    }
                    switch currentTab {
                    case "Decoder" :
                        NameMode(nameMode: "\(nameMode1)")
                    case "PvP" :
                        NameMode(nameMode: "\(nameMode2)")
                    case "PvE" :
                        NameMode(nameMode: "\(nameMode3)")
                    case "Encoder" :
                        NameMode(nameMode: "\(nameMode4)")
                    default:
                        NameMode(nameMode: "\(nameModeDefault)")
                        
                    }
                    Spacer()
                    
                    
                }
                .padding(.horizontal)
                
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        TabButton(title: "Decoder", animation: animation, currentTab: $currentTab)
                        TabButton(title: "PvP", animation: animation, currentTab: $currentTab)
                        TabButton(title: "PvE", animation: animation, currentTab: $currentTab)
                        TabButton(title: "Encoder", animation: animation, currentTab: $currentTab)
                        
                        
                    }
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .background(Color.black.opacity(0.1),in: RoundedRectangle(cornerRadius: 10))
                    .animation(Animation.easeInOut(duration: 0), value: isShowing)
                    
                    
                    
                    Spacer()
                    
                    Button(action: {
                        switch currentTab {
                        case "Decoder" :
                            textButton = "Decoder"
                        case "PvP" :
                            textButton = "PvP"
                        case "PvE" :
                            textButton = "PvE"
                        case "Encoder" :
                            textButton = "Encoder"
                        default:
                            textButton = "Режим игры"
                        }
                        isShowing = false
                        
                    }) {
                        Text("OK")
                            .font(.system(size: 25, weight: .heavy, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 80)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.top, 20)
                        
                    }
                }.padding(.top, 280)
                    .padding(.horizontal)
                
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 35)
            
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight / 2)
                
            }
                .foregroundColor(.white)
            
            
            
        )
        
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging {
                    isDragging = true
                }
                let dragonAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragonAmount / 7
                } else {
                    curHeight -= dragonAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeight {
                    curHeight = maxHeight
                }
                else if curHeight < minHeight {
                    curHeight = minHeight
                }
            }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

