//
//  LoginSignupPickerViewController.swift
//  Timeline
//
//  Created by Daniel Lee on 11/3/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class LoginSignupPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? LoginSignupViewController {
            
            if segue.identifier == "toLogin" {
                destinationViewController.mode = .Login
        
            }
            
            if segue.identifier == "toSignup" {
                destinationViewController.mode = .Signup

            }
        }
    }
    

}
