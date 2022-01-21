//
//  SettingsView.swift
//  p01-occupancy-tracker
//
//  Created by peter wi on 1/21/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var maximum: Int
    
    var body: some View {
        Form {
            Stepper("Maximum Occupancy: \(maximum)", value: $maximum, in: 1 ... Int.max)
        }
        .navigationTitle("Settings")
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
