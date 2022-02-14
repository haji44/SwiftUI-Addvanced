//
//  HomeView.swift
//  Restart
//
//  Created by kitano hajime on 2022/02/11.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onbarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {

            Spacer()
            // MARK: HEADER
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.2)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 0 : -35)
                        .animation(
                            Animation
                                .easeInOut(duration: 4)
                                .repeatForever()
                                ,value: isAnimating
                        )
            } //: HERDER
            
            // MARK: CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
            // MARK: FOOTER
            Button {
                isOnboardingViewActive = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            } //: FOTTER
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
