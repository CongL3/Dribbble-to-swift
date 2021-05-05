//
//  CarouselApp.swift
//  Carousel
//
//  Created by Cong Le on 04/05/2021.
//

import SwiftUI

@main
struct CarouselApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
