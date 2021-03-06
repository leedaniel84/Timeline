//
//  TimelineTableViewController.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
    
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func viewDidAppear(animated: Bool) {
        if let currentUser = UserController.sharedController.currentUser {
            if posts.count == 0 {
                loadTimelineForUser(currentUser)
            }
        } else {
            
            self.tabBarController?.performSegueWithIdentifier("toLoginSignUp", sender: nil)
            
        }
        
        
    }
    
    func loadTimelineForUser(user: User) {
        PostController.fetchTimelineForUser(user) { (posts) -> Void in
            
            if let posts = posts {
                self.posts = posts
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                })
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return posts.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postTableViewCell", forIndexPath: indexPath) as! PostTableViewCell

        let post = posts[indexPath.row]
        
        cell.updateWithPost(post)

        return cell
    }
    
    @IBAction func userRefreshedTable(sender: AnyObject) {
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
        if segue.identifier == "showPost" {
            
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
                
                let post = posts[indexPath.row]
                
                let destinationViewController = segue.destinationViewController as? PostDetailTableViewController
                
                destinationViewController?.post = post 
                
            }
            
        }
        
    }
    

}
