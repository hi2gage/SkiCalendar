//
//  DatesPersistencePreview.swift
//  SkiCalendar
//
//  Created by Gage Halverson on 3/6/23.
//

import CoreData

struct DatesPersistencePreview {
    var dates = [Date]()
    var calendar = Calendar(identifier: .iso8601)

    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        //        dates = [
        //            dateFormatter.date(from: "01/01/2020")!,
        //            dateFormatter.date(from: "02/01/2020")!,
        //            dateFormatter.date(from: "03/01/2020")!,
        //            dateFormatter.date(from: "04/01/2020")!,
        //            dateFormatter.date(from: "05/01/2020")!,
        //            dateFormatter.date(from: "06/01/2020")!,
        //            dateFormatter.date(from: "07/01/2020")!,
        //            dateFormatter.date(from: "08/01/2020")!,
        //            dateFormatter.date(from: "09/01/2020")!,
        //            dateFormatter.date(from: "10/01/2020")!,
        //            dateFormatter.date(from: "11/01/2020")!,
        //            dateFormatter.date(from: "12/01/2020")!,
        //            dateFormatter.date(from: "13/01/2020")!,
        //            dateFormatter.date(from: "14/01/2020")!,
        //            dateFormatter.date(from: "15/01/2020")!,
        //            dateFormatter.date(from: "16/01/2020")!,
        //            dateFormatter.date(from: "17/01/2020")!,
        //            dateFormatter.date(from: "18/01/2020")!,
        //            dateFormatter.date(from: "19/01/2020")!,
        //            dateFormatter.date(from: "20/01/2020")!
        //        ]

        dates = generationDates()

        dates = dates.map { $0.addingTimeInterval(-60 * 60 * 7) }
    }

    func generationDates() -> [Date] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        let startDate = dateFormatter.date(from: "01/01/2021")!.startOfMonth()
        let endDate = dateFormatter.date(from: "01/01/2024")!.startOfMonth()
        let interval = DateInterval(start: startDate, end: endDate)
        return generateDays(for: interval)
    }

    func generateMonths(for dateInterval: DateInterval) -> [Date] {
        generateDates(
            for: dateInterval,
            matching: calendar.dateComponents([.day], from: dateInterval.start)
        )
    }

    func generateDays(for dateInterval: DateInterval) -> [Date] {
        generateDates(
            for: dateInterval,
            matching: calendar.dateComponents([.hour, .minute, .second], from: dateInterval.start)
        )
    }

    func generateDates(
        for dateInterval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates = [dateInterval.start]

        calendar.enumerateDates(
            startingAfter: dateInterval.start.startOfMonth(),
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            guard let date else { return }

            guard date < dateInterval.end else {
                stop = true
                return
            }

            dates.append(date)
        }

        return dates
    }

    func mock(viewContext: NSManagedObjectContext) {
        dates.forEach { date in
            let dateEntity = DateColor(context: viewContext)
            dateEntity.date = date
        }
    }
}
