//
//  PostView.swift
//  p05-socialmedia
//
//  Created by Samuel Shi on 1/31/22.
//

import SwiftUI

struct PostView: View {
    let post: Post
    @State private var clickLike: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(post.authorImageAddress)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(post.authorName)
                    Text("@"+post.authorUsername)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(post.formattedDate)
                    .foregroundColor(.secondary)
            }
            Text(post.postContent)
            HStack {
                Button(action: {
                    clickLike.toggle()
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(clickLike ? .red : .secondary)
                    Text("\(clickLike ? post.likeCount + 1 : post.likeCount)")
                        .foregroundColor(clickLike ? .red : .secondary)
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "bubble.left")
                        .foregroundColor(.secondary)
                    Text("\(post.commentCount)")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .example)
            .bothColorSchemes()
    }
}
