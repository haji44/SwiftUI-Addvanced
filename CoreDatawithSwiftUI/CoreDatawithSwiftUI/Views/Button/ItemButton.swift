//
//  ItemButton.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct ItemButton: View {
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 60)
                .foregroundColor(.green)
                .padding(.horizontal, 10)
            Text("Add new Item")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

struct ItemButton_Previews: PreviewProvider {
    static var previews: some View {
        ItemButton()
    }
}
