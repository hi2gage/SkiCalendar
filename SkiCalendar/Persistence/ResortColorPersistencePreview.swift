//
//  ResortsColorDescriptionPreview.swift
//  SkiCalendar
//
//  Created by Gage Halverson on 3/6/23.
//

import CoreData
import SwiftUI

struct ResortColorPersistencePreview {
    enum Resorts: String, CaseIterable {
        case bridger = "Bridger Bowl"
        case whiteFish = "White Fish"
        case backcountry = "Backcounrty"

        var color: Color {
            switch self {
            case .backcountry:
                return .blue
            case .bridger:
                return .red
            case .whiteFish:
                return .green
            }
        }
    }

    func mock(viewContext: NSManagedObjectContext) {
        Resorts.allCases.forEach { resort in
            let colorDescription = ColorDescription(context: viewContext)
            colorDescription.color = resort.color.toHex()
            colorDescription.textDescription = resort.rawValue
            colorDescription.id = UUID()
        }
    }
}
