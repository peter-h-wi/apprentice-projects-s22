//
//  SimpleEntry.swift
//  WidgetKitCourseExtension
//
//  Created by peter wi on 3/7/22.
//

import WidgetKit

struct SimpleEntry: TimelineEntry {
    // it needs to have date.
    let date: Date
    
    // information
    let todos: [Todo]
}
