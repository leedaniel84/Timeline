//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    var mode: ViewMode = .Signup
    
    var fieldsAreValid: Bool {
        
        switch mode {
        case.Login:
            return !(emailField.text!.isEmpty || passwordField.text!.isEmpty)
            
        case .Signup:
            return !(usernameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty)
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    enum ViewMode {
        
        case Login
        case Signup
        
    }
    @IBAction func actionButtonTapped(sender: AnyObject) {
        
        if fieldsAreValid {
            switch mode {
            case .Signup:
                UserController.createUser(emailField.text!, username: usernameField.text!, password: passwordField.text!, profileImage: "none", bio: bioField.text!, url: urlField.text!, completion: { (success, user) -> Void in
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Unable to Create User", text: "Please check your information and try again.")
                    }
                })
            
            case .Login:
                UserController.aunthenticateUser(emailField.text!, password: passwordField.text!, completion: { (success, user) -> Void in
                    if success {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Unable to Create User", text: "Please check your information and try again.")
                    }
                })
            }
        } else {
            self.presentValidationAlertWithTitle("Missing Information", text: "Please check your information and try again.")
        }
    }
    
    func presentValidationAlertWithTitle(title: String, text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .Alert)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func updateViewBasedOnMode(mode: ViewMode) {
        switch mode {
        case .Login:
            usernameField.hidden = true
            bioField.hidden = true
            urlField.hidden = true
            
            actionButton.setTitle("Login", forState: .Normal)
        
        case .Signup:
            
            actionButton.setTitle("Signup", forState: .Normal)
            
            
            
        }

    }
}

















