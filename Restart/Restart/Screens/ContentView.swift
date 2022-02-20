//
//  ContentView.swift
//  Restart
//
//  Created by kitano hajime on 2022/02/11.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onbarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnbordingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
