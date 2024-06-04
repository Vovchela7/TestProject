//
//  DikidiNourApp.swift
//  DikidiNour
//
//  Created by Vovchela10 on 04.06.2024.
//

import SwiftUI

@main
struct DikidiNourApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
