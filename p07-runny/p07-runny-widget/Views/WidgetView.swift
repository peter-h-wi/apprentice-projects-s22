//
//  WidgetView.swift
//  p07-runny
//
//  Created by peter wi on 3/10/22.
//

import SwiftUI

struct WidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("\(entry.milesRan, specifier: "%.2f")")
                .font(.largeTitle)
            Text("MILES")
                .font(.headline)
        }
    }
}
