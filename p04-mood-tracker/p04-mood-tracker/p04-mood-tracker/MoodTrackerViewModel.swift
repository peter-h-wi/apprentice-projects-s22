//
//  MoodTrackerViewModel.swift
//  p04-mood-tracker
//
//  Created by peter wi on 1/22/22.
//

import Foundation
import SwiftUI

final class MoodTrackerViewModel: ObservableObject {
    @Published private var moods: [Mood] = []
    
    func addMood(curMood: String, curStrength: Int, curColor: Color) -> Int {
        let curDate = Date()
        
        if (curMood == "") {
            return 1
        }
        
        let newMood = Mood(mood: curMood, strength: curStrength+1, color: curColor, timestamp: curDate)
        moods.append(newMood)
        
        return 0
    }
    
    func getMoods() -> [Mood] {
        return moods
    }
}

extension MoodTrackerViewModel {
    static var example: [Mood] {
        [Mood.example, Mood.example, Mood.example, Mood.example]
    }
}
