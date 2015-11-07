//
//  ProfileViewController.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, ProfileHeaderCollectionReusableViewDelegate {
    
    var user: User?
    var userPosts: [Post] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if user == nil {
            user = UserController.sharedController.currentUser
            editButtonItem().enabled = true
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateBasedOnUser() {
        guard let user = user else { return}
        title = user.username
        
        PostController.postsForuser(user) { (posts) -> Void in
            if let posts = posts {
                self.userPosts = posts
            } else {
                self.userPosts = []
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.collectionView.reloadData()
                
            })
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        let post = userPosts[indexPath.item]
        
        cell.updateWithImageIdentifier(post.imageEndPoint)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", forIndexPath: indexPath) as! ProfileHeaderCollectionReusableView
        
        headerView.updateWithUser(user!)
        headerView.delegate = self
        return headerView
    }
    
    func userTappedURLButton() {
        if let profileURL = NSURL(string: user!.url!) {
            
            let safariViewController = SFSafariViewController(URL: profileURL)
            
            presentViewController(safariViewController, animated: true, completion: nil)
        }
    }
    
    func userTappedFollowActionButton() {
        
        guard let user = user else { return }
        
        if user == UserController.sharedController.currentUser {
            
            UserController.logOutCurrentUser()
            tabBarController?.selectedViewController = tabBarController?.viewControllers![0]
        } else {
            UserController.userFollowsUser(UserController.sharedController.currentUser, followsUser: user) { (follows) -> Void in
                
                if follows {
                    
                    UserController.unfollowuser(self.user!, completion: { (success) -> Void in
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.updateBasedOnUser()
                        })
                    })
                } else {
                    UserController.followUser(self.user!, completion: { (success) -> Void in
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.updateBasedOnUser()
                        })
                    })
                }
            }
        }



    
    // MARK: - Navigation

    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editUser" {
            let destinationViewController = segue.destinationViewController as? LoginSignupViewController
            
            _ = destinationViewController?.view
            //MARK: where is this damn updateWithUser coming from?
            
            destinationViewController?.updateWithUser(user)
    
        } else if segue.identifier == "profileToPostDetail" {
            if let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPathForCell(cell) {
                
                let post = userPosts[indexPath.item]
                
                let destinationViewController = segue.destinationViewController as? PostDetailTableViewController
                
                destinationViewController?.post = post
                
            }
        }
        }
        
    }
    


