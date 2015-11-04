//
//  Comment.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import Foundation

struct Comment: Equatable {
    var username: String
    var text: String
    var postIdentifier: String
    var identifier: String?
    
    init(username: String, text: String, postIdentifier: String, identifier: String? = nil) {
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
}

func == (lhs: Comment, rhs: Comment) -> Bool {
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
    
}