//
//  LoginViewController.swift
//  FurryFriends
//
//  Created by Bobby Smith on 2/2/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.enabled = false
        // Do any additional setup after loading the view.
    }

 
    @IBAction func checkIFEmpty(sender: AnyObject) {
        if userNameTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            loginButton.enabled = false
        } else {
            loginButton.enabled = true
        }

    }
    @IBAction func didPressLoginButton(sender: AnyObject) {
        loginButton.enabled = false
        spinner.startAnimating()
        delay(2.5) { () -> () in
            self.validateCredentials()
            self.spinner.stopAnimating()
            self.loginButton.enabled = true
        }
        
        
    }
    
    func validateCredentials() {
        if userNameTextField.text == "bob" && passwordTextField.text == "pass" {
            performSegueWithIdentifier("loginSeque", sender: nil)
            
        } else {
            print("Not working")
            showAlert()
        }
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Oops", message: "Wrong password", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in

        }
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }


}
