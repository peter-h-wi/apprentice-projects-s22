//
//  ProfileSettings.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileSettings: View {
    @Binding var name: String
    let username: String = "appteamcarolina"
    let profileImageAddress: String = "appteam" // will eventually be url
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
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
                    Section(content: {
                        Button(action: {
                            // delete the account
                        }) {
                            Text("Delete Account")
                        }
                    }, header: {
                        Text("Warning")
                    })
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        
    }
}

struct ProfileSettings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettings(name: .constant("carolina"))
    }
}
