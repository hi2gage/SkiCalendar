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
            TabView {
                ColorDescriptionView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Color", systemImage: "gear.badge")
                    }
                    .tag("test")

                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .tabItem {
                        Label("Color Select", systemImage: "slider.vertical.3")
                    }
                    .tag("Color")
            }
        }
    }
}
