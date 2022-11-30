//
//  CrudMobiliarioApp.swift
//  CrudMobiliario
//
//  Created by Lokura on 29/11/22.
//

import SwiftUI

@main
struct CrudMobiliarioApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(CoreDM: <#T##CoreDataManager#>)
        }
    }
}
