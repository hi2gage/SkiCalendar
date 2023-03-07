//
//  SkiCalendarApp.swift
//  SkiCalendar
//
//  Created by Gage Halverson on 3/6/23.
//

import SwiftUI

@main
struct SkiCalendarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
