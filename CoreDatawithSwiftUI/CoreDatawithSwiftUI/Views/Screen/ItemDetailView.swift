//
//  ItemDetailView.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct ItemDetailView: View {
    
    var item: Item
    
    var body: some View {
        VStack {

            ItemImfo(title: "Description", content: item.description)
            
            // MARK: Date
            ItemImfo(title: "Dead Line", content: item.date)

            
            Spacer()
        }//: VSTACK
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: MockItem.sample)
    }
}

struct ItemImfo: View {
    
    var title: String
    var content: String
    
    var body: some View {
        HStack() {
            VStack(spacing: 10) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(content)
                    .font(.body)
                    .minimumScaleFactor(0.75)
                    .lineLimit(4)
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
}


