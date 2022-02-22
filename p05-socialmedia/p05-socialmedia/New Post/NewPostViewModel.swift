//
//  NewPostViewModel.swift
//  p05-socialmedia
//
//  Created by peter wi on 2/22/22.
//

import Foundation
import SwiftUI

final class NewPostViewModel: ObservableObject {
    @Published var currentPostText: String = ""
    
    func makePost(name: String, username: String, imgAddress: String) {
        let post = Post(id: UUID(), authorName: name, authorUsername: username, authorImageAddress: imgAddress, datePosted: Date.now, postContent: currentPostText, likeCount: 0, commentCount: 0)
        PostsService.makePost(post: post)
        currentPostText = ""
    }
    
    
    
}
