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
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack() {
                            ForEach(posts, id: \.id) { post in
                                PostView(post: post)
                                    .padding()
                                Divider()
                            }
                        }
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

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
            .bothColorSchemes()
    }
}
