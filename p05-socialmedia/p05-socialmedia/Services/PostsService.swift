//
//  PostsService.swift
//  p05-socialmedia
//
//  Created by peter wi on 2/22/22.
//

import Foundation

struct PostsService {
    private static var posts: [Post] = []
    
    static func getHomeFeed() -> [Post] {
        return posts
    }
    
    static func makePost(post: Post) {
        posts.insert(post, at: 0)
    }
}
