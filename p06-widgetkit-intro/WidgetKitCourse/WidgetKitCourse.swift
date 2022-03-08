//
//  WidgetKitCourse.swift
//  WidgetKitCourse
//
//  Created by peter wi on 3/6/22.
//

import WidgetKit
import SwiftUI


@main
struct WidgetKitCourse: Widget {
    let kind: String = "WidgetKitCourse"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            // entry: timeline entry
            WidgetView(entry: entry)
        }
        // what size it supports
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("My Todos")
        .description("View your latest todo(s)")
    }
}

struct WidgetKitCourse_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
