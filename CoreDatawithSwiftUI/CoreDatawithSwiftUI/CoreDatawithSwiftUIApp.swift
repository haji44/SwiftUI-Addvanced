//
//  CoreDatawithSwiftUIApp.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

@main
struct CoreDatawithSwiftUIApp: App {
    
    @StateObject private var dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            CloudKitSignInView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
