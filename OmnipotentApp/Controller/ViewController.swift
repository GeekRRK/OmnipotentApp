//
//  ViewController.swift
//  OmnipotentApp
//
//  Created by suorui on 15/11/30.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SRAnimatedImagesViewDelegate {
    //MARK: - properties
    @IBOutlet weak var bkgView: SRAnimatedImagesView!
    
    
    //MARK: - system methods
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        bkgView.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Register notifications about keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: self.view.window)
        
        bkgView.delegate = self;
    }

    //MARK: - login related methods
    @IBAction func login(sender: UIButton) {
        view.setNeedsDisplay()
    }

    @IBAction func findPwd(sender: UIButton) {
    }
    
    @IBAction func newUser(sender: UIButton) {
    }
    
    //MARK: - SRAnimatedImagesViewDelegate
    func animatedImagesNumberOfImages(animatedImagesView: SRAnimatedImagesView) -> Int {
        return 2
    }
    
    func animatedImagesView(animatedImagesView: SRAnimatedImagesView, imageAtIndex: Int) -> UIImage {
        return UIImage(named: "login_background")!
    }
    
    //MARK: - response to notification about keyboard
    //self.bkgView is a subclass of UIControl， this action is supposed to hide keyboard.
    @IBAction func touchBkgView(sender: SRAnimatedImagesView) {
        self.view .endEditing(true)
    }
    
    func keyboardWillHide(notif: NSNotification) {
        if IPHONE4S == false {
            return;
        }
        
        UIView .animateWithDuration(0.25, animations: {
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        })
    }
    
    func keyboardWillShow(notif: NSNotification) {
        if IPHONE4S == false {
            return;
        }
        
        UIView .animateWithDuration(0.25, animations: {
            self.view.frame = CGRectMake(0, -120, self.view.frame.size.width, self.view.frame.size.height)
        })
    }
}

