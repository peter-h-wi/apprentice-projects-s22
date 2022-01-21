//
//  MissionDetailView.swift
//  p02-apollo
//
//  Created by Samuel Shi on 1/12/22.
//

import SwiftUI

struct MissionDetailView: View {
    // use this mission to display the content on the detail view
    let mission: Mission
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.secondary)
                            .padding(.vertical)
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.secondary)
                            .padding(.vertical)
                        
                        Text("Crews")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        ForEach(mission.crew, id: \.id) { crewMember in
                            HStack {
                                Image(crewMember.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.2)
                                    .cornerRadius(10)
                                VStack(alignment: .leading) {
                                    Text(crewMember.name)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                    Text(crewMember.role)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        
        
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(mission.displayName)
    }
}

struct MissionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailView(mission: .example)
    }
}
