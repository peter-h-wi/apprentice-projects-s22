//
//  p07_runny_widget.swift
//  p07-runny-widget
//
//  Created by peter wi on 3/8/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), milesRan: MilesRanStore.fetchMiles())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), milesRan: MilesRanStore.fetchMiles())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        let milesRan = MilesRanStore.fetchMiles()

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, milesRan: milesRan)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let milesRan: Double
}

struct p07_runny_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text("\(entry.milesRan, specifier: "%.2f") Miles")
    }
}

@main
struct p07_runny_widget: Widget {
    let kind: String = "p07_runny_widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            p07_runny_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct p07_runny_widget_Previews: PreviewProvider {
    static var previews: some View {
        p07_runny_widgetEntryView(entry: SimpleEntry(date: Date(), milesRan: MilesRanStore.fetchMiles()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
