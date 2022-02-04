//
//  HomeFeedView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 2/1/22.
//

import SwiftUI

struct HomeFeedView: View {
    let posts: [Post] = PostList.defaultPosts
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(posts, id: \.id) { post in
                            VStack {
                                Image(post.authorImageAddress)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                                    .padding(3)
                                    .overlay(Circle().stroke(.blue, lineWidth: 2))
                                Text(post.authorName.components(separatedBy: " ").first!)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .frame(height: 100)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack() {
                        ForEach(posts, id: \.id) { post in
                            Divider()
                            PostView(post: post)
                                .padding()
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("bluebird")
                            .font(.system(.title, design: .serif))
                            .bold()
                            .foregroundColor(.blue)
                            .italic()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
            }
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
