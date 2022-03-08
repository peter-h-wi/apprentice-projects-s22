//
//  Provider.swift
//  WidgetKitCourseExtension
//
//  Created by peter wi on 3/7/22.
//

import WidgetKit




// scheduling
struct Provider: TimelineProvider {
    // widget gallery
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)])
    }

    // current version of widget
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            do {
                let todos = try await TodoService.shared.getAllTodos()
                let fiveTodos = Array(todos.prefix(5))
                let entry = SimpleEntry(date: .now, todos: fiveTodos)
                
                completion(entry)
            } catch {
                completion(SimpleEntry(date: .now, todos: [.placeholder(0)]))
            }
        }
    }

    // schedule widget - when and what to update widget
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        Task {
            do {
                let allTodos = try await TodoService.shared.getAllTodos()
                // prefix: give first 5 entries
                let fiveTodos = Array(allTodos.prefix(5))
                let entry = SimpleEntry(date: .now, todos: fiveTodos)
                
                let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 30)))
                
                completion(timeline)
            } catch {
                let entries = [SimpleEntry(date: .now, todos: [.placeholder(0)])]
                let timeline = Timeline(entries: entries, policy: .after(.now.advanced(by: 60 * 60 * 30)))
                
                completion(timeline)
            }
        }
    }
}
