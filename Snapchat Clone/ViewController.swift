//
//  ViewController.swift
//  Snapchat Clone
//
//  Created by Richard Tyran on 5/3/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var username: UITextField!
    
    @IBAction func signIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(username.text, password:"mypass") {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                
                println("logged in")
            
                self.performSegueWithIdentifier("showUsers", sender: self)
                
            } else {
                
                var user = PFUser()
                user.username = self.username.text
                user.password = "mypass"
                
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool?, error: NSError?) -> Void in
                    if error == nil {
                        
                        println("signed up")
                        
                        self.performSegueWithIdentifier("showUsers", sender: self)
                        
                    } else {
                        
                        println(error)
                    }
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            
            self.performSegueWithIdentifier("showUsers", sender: self)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

