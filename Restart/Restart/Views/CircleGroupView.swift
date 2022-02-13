//
//  CircleGroupView.swift
//  Restart
//
//  Created by kitano hajime on 2022/02/12.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
        }
        .frame(width: 260, height: 260, alignment: .center)
        .blur(radius: isAnimating ? 0: 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView(shapeColor: .gray, shapeOpacity: 0.2)
    }
}
