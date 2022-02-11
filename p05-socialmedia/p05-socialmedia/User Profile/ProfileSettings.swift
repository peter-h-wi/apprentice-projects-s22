//
//  ProfileSettings.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileSettings: View {
    @State private var name: String = "App Team Carolina"
    let username: String = "appteamcarolina"
    let profileImageAddress: String = "appteam" // will eventually be url
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(profileImageAddress)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, geo.size.width*0.2)
                    .clipShape(Circle())
                Form {
                    Section(content: {
                        Text(username)
                            .foregroundColor(.secondary)
                    }, header: {
                        Text("ID")
                    })
                    Section(content: {
                        TextField("Name", text: $name)
                    }, header: {
                        Text("Name")
                    })
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        
                    }
                }
            }
        }
        
    }
}

struct ProfileSettings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettings()
    }
}
