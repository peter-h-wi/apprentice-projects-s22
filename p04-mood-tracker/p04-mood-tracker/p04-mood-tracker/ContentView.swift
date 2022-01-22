//
//  ContentView.swift
//  p04-mood-tracker
//
//  Created by peter wi on 1/22/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MoodTrackerViewModel()
    
    var body: some View {
        MoodTrackerView(vm: vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
