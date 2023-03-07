//
//  Date+Extension.swift
//  SkiCalendar
//
//  Created by Gage Halverson on 3/6/23.
//

import Foundation

extension Date {
    func startOfMonth() -> Date {
        Calendar.current.date(
            from: Calendar.current.dateComponents(
                [.year, .month],
                from: Calendar.current.startOfDay(for: self)
            )
        )!
    }

    func endOfMonth() -> Date {
        Calendar.current.date(byAdding: DateComponents(month: 1, day: 0), to: startOfMonth())!
    }

    func getDayOfMonth() -> Int {
        let components = Calendar.current.dateComponents([.day, .month, .year], from: self)
        let day: Int = components.day!
        return day
    }
}
