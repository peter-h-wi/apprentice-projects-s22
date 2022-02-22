//
//  HomeFeedViewModel.swift
//  p05-socialmedia
//
//  Created by peter wi on 2/22/22.
//

import Foundation

final class HomeFeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        posts = PostsService.getHomeFeed()
    }
}
