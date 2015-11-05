//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    @IBAction func selectedIndexChange(sender: AnyObject) {
        
    }
    
    enum ViewMode: Int {
        case Friends
        case All
        
        func users(completion: (users: [User]?) -> Void) {
            
            switch self {
                
            case .Friends:
                UserController.followedByUser(UserController.sharedController.currentUser) { (followers) -> Void in
                    completion(users: followers)
                }
                
            case .All:
                UserController.fetchAllUsers() { (users) -> Void in
                    completion(users:users)
                }
            }
            
        }
        
    }
    
    var userDataSource: [User] = []
    
    
    var mode: ViewMode {
        get {
            return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
        }
    }
    
    func updateViewBasedOnMode() {
        mode.users() { (users) -> Void in
            if let users = users {
                self.userDataSource = users
            } else {
                self.userDataSource = []
            }
            
            self.tableView.reloadData()
        }
    }
    
    func setupSearchController() {
        
        let resultController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("UserSearchResultsTableViewController")
        
        searchController = UISearchController(searchResultsController: resultController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!.lowercaseString
        let resultsViewController = searchController.searchResultsController as! UserSearchResultsTableViewController
        
        resultsViewController.usersResultsDataSource = userDataSource.filter({$0.username.lowercaseString.containsString(searchTerm)})
        resultsViewController.tableView.reloadData()
    }

    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewBasedOnMode()
        setupSearchController()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return userDataSource.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = tableView.dequeueReusableCellWithIdentifier("usernameCell", forIndexPath: indexPath)
        
        let user = userDataSource[indexPath.row]
        
        cell.textLabel?.text = user.username
        
        return cell
    
        
        
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue = "toProfileView" {
            
        }
    }
    

    }
}
