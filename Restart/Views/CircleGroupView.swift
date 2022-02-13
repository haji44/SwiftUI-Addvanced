//
//  CircleGroupView.swift
//  Restart
//
//  Created by kitano hajime on 2022/02/12.
//

import SwiftUI

struct CircleGroupView: View {
    
    var shapeColor: Color
    var shapeOpacity: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
        }
        .frame(width: 260, height: 260, alignment: .center)
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView(shapeColor: .gray, shapeOpacity: 0.2)
    }
}
