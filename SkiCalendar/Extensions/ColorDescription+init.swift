//
//  ColorDescription+init.swift
//  SkiCalendar
//
//  Created by Gage Halverson on 3/9/23.
//
import CoreData
import SwiftUI

extension ColorDescription {
    convenience init(color: Color, context: NSManagedObjectContext) {
        self.init(context: context)
        id = UUID()
        self.color = color.toHex()
    }
}
