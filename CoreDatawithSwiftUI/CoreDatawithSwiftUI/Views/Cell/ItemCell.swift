//
//  ItemCell.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct ItemCell: View {
    
    var item: Item
    
    var body: some View {
        HStack() {
            VStack(spacing: 10) {
            Text("Description")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(item.description)
                .font(.body)
                .minimumScaleFactor(0.75)
                .lineLimit(4)
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
}


struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(item: MockItem.sample)
    }
}



