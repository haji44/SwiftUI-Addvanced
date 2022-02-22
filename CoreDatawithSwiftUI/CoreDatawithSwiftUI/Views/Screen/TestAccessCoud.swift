//
//  TestAccessCoud.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/22.
//

import Foundation
import CloudKit
import CoreData
import SwiftUI

class CloudKitViewModel: ObservableObject {
    
    @Published var isSignedInfoCloud: Bool = false
    @Published var error: String = ""
    
    init() {
        getCloudStatus()
    }
    
    private func getCloudStatus() {
        CKContainer.default().accountStatus { [weak self] status, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch status {
                case .couldNotDetermine:
                    self.error = CloudKitError.iCloudAccountNotDetermine.localizedDescription
                case .available:
                    self.isSignedInfoCloud = true
                case .restricted:
                    self.error = CloudKitError.iCloudAccountRestricted.localizedDescription
                case .noAccount:
                    self.error = CloudKitError.iCloudAccountNotFound.localizedDescription
                case .temporarilyUnavailable:
                    self.error = CloudKitError.iCloudAccountUnkown.localizedDescription
                @unknown default:
                    self.error = CloudKitError.iCloudAccountUnkown.localizedDescription
                }
            }
        }
    }
    
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermine
        case iCloudAccountRestricted
        case iCloudAccountUnkown

    }
}


struct CloudKitSignInView: View {
    
    @StateObject var vm = CloudKitViewModel()
    
    var body: some View {
        VStack {
            Text("Is SIGNED in \(vm.isSignedInfoCloud.description.uppercased())")
            Text(vm.error)
        }
    }
}
