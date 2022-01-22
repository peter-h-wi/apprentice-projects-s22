//
//  Mood.swift
//  p04-mood-tracker
//
//  Created by peter wi on 1/22/22.
//

import Foundation
import SwiftUI

struct Mood: Identifiable {
    let id = UUID()
    let mood: String
    let strength: Int
    let color: Color
    let timestamp: Date
    
    var formattedTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
}

extension Mood {
    static var example: Mood {
        Mood(mood: "Happy", strength: 2, color: .blue, timestamp: Date())
    }
}
