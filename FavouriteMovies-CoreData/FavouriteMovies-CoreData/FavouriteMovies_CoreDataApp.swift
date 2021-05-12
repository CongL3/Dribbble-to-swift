//
//  FavouriteMovies_CoreDataApp.swift
//  FavouriteMovies-CoreData
//
//  Created by Cong Le on 12/05/2021.
//

import SwiftUI

// what is @main?
@main
struct FavouriteMovies_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
			// passes managed object context to all child views
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
