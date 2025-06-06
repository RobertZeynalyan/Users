//
//  UsersApp.swift
//  Users
//
//  Created by Robert on 22.04.25.
//

import SwiftUI

@main
struct UsersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
