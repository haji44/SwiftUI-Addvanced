//
//  OnbordingView.swift
//  Restart
//
//  Created by kitano hajime on 2022/02/11.
//

import SwiftUI

struct OnbordingView: View {
    // MARK: -PROPERTY
    @AppStorage("onbarding") var isOnboardingViewActive: Bool = false
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            
            VStack (spacing: 30){
                // MARK: - HEADER
                Spacer()
                VStack(spacing: 0) {
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating )
                // MARK: - CENTER
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1: 0)
                        .animation(.easeOut(duration: 1), value: isAnimating)
                } //: CENTER
                
                Spacer()
                // MARK: - FOOTER
                ZStack {
                    // PARTS OF CUSTOME BUTTON
                    // 1. BACKGROUND
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. CALL TO ACTION
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(x: 20)
                    
                    // 3. CAPSULE
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    // 4. CIRCLE
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{_ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        }
                                        buttonOffset = 0
                                    }
                                }
                        )
                        
                        Spacer()
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80,  alignment: .center)
                .padding()
                .opacity(isAnimating ? 1: 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeInOut(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}
