//
//  ProfileView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/2/22.
//

import SwiftUI

struct ProfileView: View {
    let name: String = "App Team Carolina"
    let username: String = "appteamcarolina"
    let profileImageAddress: String = "appteam" // will eventually be url
    @State private var menuIndex = 0
    
    let userPosts: [Post] = PostList.defaultPosts

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Color(.blue).opacity(0.3)
                .frame(height: 100)
            VStack(alignment: .leading, spacing: 0) {
                TopView(name: name, username: username, profileImageAddress: profileImageAddress)
                
                MenuView(menuIndex: $menuIndex)
                Rectangle()
                    .frame(width: .infinity, height: 2)
                    .foregroundColor(.secondary)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text("Topics to follow")
                            .font(.title2)
                            .bold()
                        Text("Tweets about the Topics you follow show up in your Home timeline")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    ForEach(userPosts, id: \.id) { post in
                        PostView(post: post)
                    }
                }
                .padding()
            }
            .offset(y: -40)
        }
        .ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .bothColorSchemes()
    }
}

struct TopView: View {
    let name: String
    let username: String
    let profileImageAddress: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(profileImageAddress)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                    .overlay(Circle()
                                .stroke(.primary, lineWidth: 4))
                    .shadow(radius: 10)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                }
                .background(
                    RoundedRectangle(
                        cornerRadius: 10,
                        style: .continuous
                    ).stroke(Color.secondary, lineWidth: 3))
            }
            Text(name)
                .font(.title)
                .bold()
                .foregroundColor(.primary)
            Text("@"+username)
                .font(.body)
                .foregroundColor(.secondary)
            HStack {
                Image(systemName: "calendar")
                Text("Joined May 2021")
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .padding(.vertical, 8)
            HStack {
                Text("35")
                    .foregroundColor(.primary)
                Text("Following")
                    .foregroundColor(.secondary)
                Text("2364")
                    .foregroundColor(.primary)
                Text("Followers")
                    .foregroundColor(.secondary)
            }
            .font(.footnote)
            .padding(.vertical, 8)
        }
        .padding()
    }
}

struct MenuView: View {
    @Binding var menuIndex: Int
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    menuIndex = 0
                }
            }) {
                VStack {
                    Text("Tweets")
                        .foregroundColor(menuIndex == 0 ? .primary : .secondary)
                        .bold()
                    Rectangle()
                        .frame(height: 4)
                        .foregroundColor(.accentColor)
                        .opacity(menuIndex == 0 ? 1 : 0)
                }
                .frame(width: 60)
            }
            Spacer()
            Button(action: {
                withAnimation {
                    menuIndex = 1
                }
            }) {
                VStack {
                    Text("Tweet & Replies")
                        .foregroundColor(menuIndex == 1 ? .primary : .secondary)
                        .bold()
                    Rectangle()
                        .frame(height: 4)
                        .foregroundColor(.accentColor)
                        .opacity(menuIndex == 1 ? 1 : 0)
                }
                .frame(width: 130)
            }
            Spacer()
            Button(action: {
                withAnimation {
                    menuIndex = 2
                }            }) {
                VStack {
                    Text("Media")
                        .foregroundColor(menuIndex == 2 ? .primary : .secondary)
                        .bold()
                    Rectangle()
                        .frame(height: 4)
                        .foregroundColor(.accentColor)
                        .opacity(menuIndex == 2 ? 1 : 0)
                }
                .frame(width: 50)
            }
            Spacer()
            Button(action: {
                withAnimation {
                    menuIndex = 3
                }            }) {
                VStack {
                    Text("Likes")
                        .foregroundColor(menuIndex == 3 ? .primary : .secondary)
                        .bold()
                    Rectangle()
                        .frame(height: 4)
                        .foregroundColor(.accentColor)
                        .opacity(menuIndex == 3 ? 1 : 0)
                }
                .frame(width: 50)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.secondary)
    }
}
