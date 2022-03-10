//
//  MilesRanStore.swift
//  p07-runny
//
//  Created by peter wi on 3/8/22.
//

import Foundation
import WidgetKit

struct MilesRanStore {
    static let milesKey = "miles"
    
    static private let defaults = UserDefaults(suiteName: "group.com.peter-h-wi.p07-runny.contents")!

    static func save(miles: Double) {
        defaults.set(miles, forKey: milesKey)
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    static func fetchMiles() -> Double {
        return defaults.double(forKey: milesKey)
    }
}
