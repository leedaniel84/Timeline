//
//  UserController.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import Foundation

class UserController {
    
    static let sharedController = UserController()
    
    var currentUser: User!
    
    init (currentUser: User! = nil) {
        
    }
    
    static func userForIdentifier(identifier: String, completion: (user:User?) -> Void) {
        
        completion(user: mockUsers().first)
        
    }
    
    static func fetchAllUsers(completion: (user: [User]) -> Void) {
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        
    }
    
    static func userFollowsUser(user: User, followsUser: User, completion: (follows: Bool) -> Void) {
        
    }
    
    static func followedByUser(user:User, completion: (followed: [User]?) -> Void) {
        
    }
    
    static func aunthenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
    static func createUser(email: String, username: String, password: String, profileImage: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
    static func updateUser(user: User, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
    static func unfollowuser(user: User, completion: (success: Bool) -> Void ) {
        
    }
    
    static func logOutCurrentUser() -> Void {
        
    }
    
    static func mockUsers() -> [User] {
        
        let user1 = User(username: "luke", bio: nil, url: nil, identifier: "36234")
        let user2 = User(username: "Boba Fett", bio: nil, url: nil, identifier: "37269025")
        let user3 = User(username: "Kylo", bio: nil, url: nil, identifier: "49593847")
        
        return [user1, user2, user3]
        
    }
    
}
