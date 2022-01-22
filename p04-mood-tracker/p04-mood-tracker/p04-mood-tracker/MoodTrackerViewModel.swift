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
    @Published var selectedStrength = 1
    @Published var myMood = ""
    @Published var myColor = Color.cyan
    @Published var isShort = false
    
    func addMood() {
        if (myMood == "") {
            return
        }
        
        let curDate = Date()
        
        let newMood = Mood(mood: myMood, strength: selectedStrength+1, color: myColor, timestamp: curDate)
        moods.append(newMood)
        
        resetInput()
    }
    
    func resetInput() {
        selectedStrength = 1
        myMood = ""
    }
    
    func getMoods() -> ArraySlice<Mood> {
        if (isShort) {
            return getTopThreeMoods()
        }
        return moods[0..<moods.count]
    }
    
    func getTopThreeMoods() -> ArraySlice<Mood> {
        let n = moods.count
        if (n>=3) {
            return moods[n-3..<n]
        }
        return moods[0..<n]
    }
}

extension MoodTrackerViewModel {
    static var example: [Mood] {
        [Mood.example, Mood.example, Mood.example, Mood.example]
    }
}
