//
//  MoodTrackerViewModel.swift
//  p04-mood-tracker
//
//  Created by peter wi on 1/22/22.
//

import Foundation
import CoreData
import SwiftUI

final class MoodTrackerViewModel: ObservableObject {
    @Published var selectedStrength = 1
    @Published var myMood = ""
    @Published var myColor : Color = .cyan
    @Published var isShort = false
    
    @Published var moods: [MoodViewModel] = []
    
    
    func addMood() {
        if (myMood == "") {
            return
        }
        let moodData = MoodData(context: CoreDataManager.shared.viewContext)
        moodData.mood = myMood
        moodData.strength = Int64(selectedStrength+1)
        moodData.r = myColor.components.red
        moodData.g = myColor.components.green
        moodData.b = myColor.components.blue
        moodData.o = myColor.components.opacity
        
        moodData.timeStamp = Date()
        
        CoreDataManager.shared.save()
        fetchAllMoods()
        
        resetInput()
    }
    
    func fetchAllMoods() {
        moods = CoreDataManager.shared.getAllMoods().map(MoodViewModel.init)
    }
    
    func resetInput() {
        selectedStrength = 1
        myMood = ""
    }
    
    func getMoods() -> ArraySlice<MoodViewModel> {
        if (isShort) {
            return getTopThreeMoods()
        }
        return moods[0..<moods.count]
    }
    
    func getTopThreeMoods() -> ArraySlice<MoodViewModel> {
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


struct MoodViewModel {
    let moodData: MoodData
    
    var id: NSManagedObjectID {
        return moodData.objectID
    }
    
    var mood: String {
        return moodData.mood ?? ""
    }
    
    var strength: Int {
        return Int(moodData.strength)
    }
    
    var r: Double {
        return moodData.r
    }
    
    var g: Double {
        return moodData.g
    }
    
    var b: Double {
        return moodData.b
    }
    
    var o: Double {
        return moodData.o
    }
    
    var timeStamp: Date {
        return moodData.timeStamp ?? Date()
    }
    
    var formattedTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: moodData.timeStamp ?? Date())
    }
}
extension Color {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {

        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            // You can handle the failure here as you want
            return (0, 0, 0, 0)
        }

        return (r, g, b, o)
    }
}
