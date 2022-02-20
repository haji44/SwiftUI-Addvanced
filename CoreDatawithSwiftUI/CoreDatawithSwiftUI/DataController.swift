//
//  DataController.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/21.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "TodoItem") // name must be identical to core data model
    
    init() {
        container.loadPersistentStores { descripton, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            
            
        }
    }
}
