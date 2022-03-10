//
//  p07_runny_widget.swift
//  p07-runny-widget
//
//  Created by peter wi on 3/8/22.
//

import WidgetKit
import SwiftUI

@main
struct p07_runny_widget: Widget {
    let kind: String = "p07_runny_widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct p07_runny_widget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date(), milesRan: MilesRanStore.fetchMiles()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
