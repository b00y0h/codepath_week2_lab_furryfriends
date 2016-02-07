//
//  FriendsViewController.swift
//  FurryFriends
//
//  Created by Bobby Smith on 2/2/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var rabbitView: UIImageView!
    
    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var showHideBtn: UIButton!
    
    var initialX: CGFloat!
    var initialY: CGFloat!
    
    var scale: CGFloat! = 1.1
    var rotation: Double! = 13.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseLabel.text = ""
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapToMoveRabbit:")
        view.userInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer)
        
        initialY = rabbitView.frame.origin.y
        initialX = rabbitView.frame.origin.x

    }

    @IBAction func dismissLoginButton(sender: AnyObject) {
        showAlert()
    }
    
    
    func showAlert() {
        let alertController = UIAlertController(title: "Are you sure you want to log out?", message: "", preferredStyle: .ActionSheet)
        
        let okAction = UIAlertAction(title: "Log Out", style: .Destructive) { action -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { action -> Void in}
        
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }

    
    

    @IBAction func didPressUpArrow(sender: AnyObject) {
        UIView.animateWithDuration(0.1) { () -> Void in
            self.rabbitView.center.y -= 30
        }
    }
    @IBAction func didPressDownArrow(sender: AnyObject) {
        UIView.animateWithDuration(0.1) { () -> Void in
        self.rabbitView.center.y += 30
        }
    }
    @IBAction func didPressLeftArrow(sender: AnyObject) {
        UIView.animateWithDuration(0.1) { () -> Void in
        self.rabbitView.center.x -= 30
        }
    }
    @IBAction func didPressRightArrow(sender: AnyObject) {
        UIView.animateWithDuration(0.1) { () -> Void in
        self.rabbitView.center.x += 30
        }
    }

    @IBAction func resetRabbitButton(sender: AnyObject) {
        rabbitView.transform = CGAffineTransformMakeScale(1, 1)
        rabbitView.frame.origin.x = initialX
        rabbitView.frame.origin.y = initialY
        rabbitView.hidden = false
    }
    
    @IBAction func hideRabbitButton(sender: AnyObject) {
        rabbitView.hidden = !rabbitView.hidden
        if rabbitView.hidden {
            showHideBtn.setTitle("Show Rabbit", forState: .Normal)
        } else {
            showHideBtn.setTitle("Hide Rabbit", forState: .Normal)
        }
    }
    
    
    func tapToMoveRabbit(sender: UITapGestureRecognizer) {
        let point = sender.locationInView(view)
        UIView.animateWithDuration(0.1) { () -> Void in
            self.rabbitView.center.x = point.x
            self.rabbitView.center.y = point.y
        }

    }
    
    @IBAction func didPressFeedBtn(sender: AnyObject) {
        scale = scale * 1.5

        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.6, options: .CurveEaseInOut, animations: { () -> Void in

            self.rabbitView.transform = CGAffineTransformMakeScale(self.scale, self.scale)
            
            }, completion: nil)
    }
    @IBAction func didPressDietBtn(sender: AnyObject) {
        scale = scale * 0.8
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.6, options: .CurveEaseInOut, animations: { () -> Void in
            
            self.rabbitView.transform = CGAffineTransformMakeScale(self.scale, self.scale)
            
            }, completion: nil)
        
    }
    
    @IBAction func rotateLeftButton(sender: AnyObject) {
        rotateLeft()
    }
    
    @IBAction func rotateRight(sender: AnyObject) {
        rotateRight()
    }
    
    func rotateLeft(){
        rotation = rotation - 15.0
        rabbitView.transform = CGAffineTransformMakeRotation(CGFloat(rotation * M_PI / 180))
    }
    
    func rotateRight(){
        rotation = rotation + 15.0
        rabbitView.transform = CGAffineTransformMakeRotation(CGFloat(rotation * M_PI / 180))
    }
    
    @IBAction func didPressSend(sender: AnyObject) {
        spinner.startAnimating()
        sendButton.enabled = false
        
        delay(2) { () -> () in
        
            self.spinner.stopAnimating()
            self.sendButton.enabled = true

        switch self.messageField.text! {
            case "Hello":
                self.responseLabel.text = "Howdy Partner"
            case "What's your name?":
                self.responseLabel.text = "Wascally Rabbit's my name. Eattin carrot's my game."
            case "Will you be my friend?":
                self.responseLabel.text = "I'm a rabbit. So, no"
            
            default:
                self.responseLabel.text = "Could you repeat that?"
            }
            
            delay(5, closure: { () -> () in
                self.responseLabel.text = ""
            })
        }
    }
    
    
    
}
