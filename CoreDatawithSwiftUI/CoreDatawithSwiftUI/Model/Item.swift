//
//  Item.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import Foundation

struct Item : Identifiable{
    var id = UUID()
    var title: String
    var description: String
    var date: String
    var isDone: Bool
}

struct MockItem {
    static var sample = Item(title: "Event Title", description: "This is the test description", date: "2020-02-02", isDone: false)
}
