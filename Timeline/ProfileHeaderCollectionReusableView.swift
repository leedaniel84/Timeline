//
//  ProfileHeaderCollectionReusableView.swift
//  Timeline
//
//  Created by Jay Maloney on 11/5/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

protocol ProfileHeaderCollectionReusableViewDelegate {
    
    func userTappedFollowActionButton()
    func userTappedURLButton()
    
}

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBAction func urlButtonTapped(sender: AnyObject) {
        delegate?.userTappedURLButton()
    }
    
    @IBAction func followActionButtonTapped(sender: AnyObject) {
        delegate?.userTappedFollowActionButton()
    }
    
    @IBOutlet var bioLabel: UILabel!
    
    @IBOutlet var urlButton: UIButton!
        
    @IBOutlet var followButton: UIButton!
    
    var delegate: ProfileHeaderCollectionReusableViewDelegate?
    
    func updateWithUser(user: User) {
        
        if let bio = user.bio {
            bioLabel.text = bio
        } else {
            bioLabel.hidden = true
        }
        
        if let url = user.url {
            urlButton.setTitle(url, forState: .Normal)
        } else {
            urlButton.hidden = true
        }
        
        if user == UserController.sharedController.currentUser {
            followButton.setTitle("Logout", forState: .Normal)
        } else {
            UserController.userFollowsUser(UserController.sharedController.currentUser, followsUser: user, completion: { (follows) -> Void in
                if follows {
                    self.followButton.setTitle("Unfollow", forState: .Normal)
                } else {
                    self.followButton.setTitle("Follow", forState: .Normal)
                }
            })
        }
    }
    
}
