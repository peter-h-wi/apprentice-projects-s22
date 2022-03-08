//
//  Todo.swift
//  p06-widgetkit-intro
//
//  Created by peter wi on 3/6/22.
//

import Foundation

struct Todo: Identifiable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

extension Todo {
    static func placeholder(_ id: Int) -> Todo {
        Todo(userId: 0, id: id, title: "Placeholder", completed: .random())
    }
}
