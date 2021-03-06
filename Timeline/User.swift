
//
//  User.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//


import Foundation


struct User: Equatable, FirebaseType {
    
    private let kUsername = "username"
    private let kBio = "bio"
    private let kURL = "url"
    
    var username = " "
    var bio: String?
    var url: String?
    var identifier: String?
    var endpoint: String {
        return "users"
    }
    
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kUsername: username]
        
        if let bio = bio {
            json.updateValue(bio, forKey: kBio)
        }
        
        if let url = url {
            json.updateValue(url, forKey: kURL)
        }
        
        return json
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        
        guard let username = json[kUsername] as? String else {return nil}
        
        self.username = username
        self.bio = json[kBio] as? String
        self.url = json[kURL] as? String
        self.identifier = identifier
    }
    
    init (username: String, uid: String, bio: String?, url: String? = nil) {
        self.username = ""
        self.bio = ""
        self.url = ""
        self.identifier = ""
        
    }
    
}

func == (lhs: User, rhs: User) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
    
}
