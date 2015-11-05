//
//  PostController.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import Foundation
import UIKit


class PostController {
    
    static func fetchTimelineForUser(user: User, completion: (post: [Post]?) -> Void) {
        
        
    }
    
    static func addPost(image: UIImage, caption: String?, completion: (post: Post?) -> Void) {
        
        
    }
    
    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {
        
    }
    
    static func postsForuser(username: String, completion: (post: [Post]?) -> Void) {
        
    }
    
    static func deletePost(post: Post, completion: (success: Bool) -> Void) {
        
    }
    
    static func addCommentWithTextToPost(text: String, post: Post, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func deleteComment(comment: Comment, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func orderPosts(post: [Post]) -> [Post] {
        
    }
    
    static func mockPosts() {
        
        let sampleImageIdentifier = "-K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "darth", postIdentifier: "1234")
        let like2 = Like(username: "look", postIdentifier: "4566")
        let like3 = Like(username: "em0r0r", postIdentifier: "43212")
        
        let comment1 = Comment(username: "ob1kenob", text: "use the force", postIdentifier: "1234")
        let comment2 = Comment(username: "darth", text: "join the dark side", postIdentifier: "4566")
        
        let post1 = Post(imageEndPoint: sampleImageIdentifier, caption: "Nice shot!", username: "darth", comments: [comment1, comment2], likes: [like1, like2, like3])
        let post2 = Post(imageEndPoint: sampleImageIdentifier, caption: "Boom!", username: "R2D2", comments: [comment1, comment2], likes: [like2, like3])
        let post3 = Post(imageEndPoint: sampleImageIdentifier, caption: "What?!", username: "C3PO")
        
        
        return [post1, post2, post3]
    }
        
}
    
