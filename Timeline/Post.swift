//
//  Post.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import Foundation


struct Post: Equatable {
    
    var imageEndPoint: String
    var caption: String?
    var username: String
    var comments: [Comment]
    var likes: [Like]
    var identifier: String?
    
    init (imageEndPoint: String, caption: String?, username: String, comments: [Comment] = [], likes: [Like] = [], identifier: String? = nil) { //why is identifier = nil when caption is an optional too?
        
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = likes
        
    }
    
}

func == (lhs: Post, rhs: Post) -> Bool {
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}