
//
//  User.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//


import Foundation


struct User: Equatable {
    
    var username = " "
    var bio: String?
    var url: String?
    var identifier: String?
    
    init (username: String, bio: String?, url: String?, identifier: String?) {
        self.username = ""
        self.bio = ""
        self.url = ""
        self.identifier = ""
        
    }
    
}

func == (lhs: User, rhs: User) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
    
}
