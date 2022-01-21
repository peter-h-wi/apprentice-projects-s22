//
//  ContentView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    // use this array of missions to show your mission content
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(0..<missions.count) { row in
                NavigationLink {
                    MissionDetailView(mission: missions[row])
                } label: {
                    HStack {
                        Image(missions[row].imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(alignment: .leading) {
                            Text(missions[row].displayName)
                                .font(.body)
                                .foregroundColor(.primary)
                            Text("\(missions[row].formattedLaunchDate)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("NASA Missions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
