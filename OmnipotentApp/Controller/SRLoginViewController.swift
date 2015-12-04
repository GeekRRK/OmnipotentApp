//
//  ViewController.swift
//  OmnipotentApp
//
//  Created by suorui on 15/11/30.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class SRLoginViewController: UIViewController, SRAnimatedImagesViewDelegate {
    //MARK: - properties
    @IBOutlet weak var bkgView: SRAnimatedImagesView!
    @IBOutlet weak var loginBtn: UIButton!
    
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
        SRUtil.customizeNavBar(self.navigationController?.navigationBar)
        
        self.bkgView.hidden = false
        bkgView.startAnimating()
    }
    
    override func viewWillDisappear(animated: Bool) {
        SRUtil.deCustomizeNavBar(self.navigationController?.navigationBar)
        self.bkgView.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loginBtn.setBackgroundImage(SRUtil.createImageWithColor(UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 0.6)), forState: .Normal)
        self.loginBtn.setBackgroundImage(SRUtil.createImageWithColor(UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 0.8)), forState: .Highlighted)
        
        //Register notifications about keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: self.view.window)
        
        bkgView.delegate = self
    }

    //MARK: - login related methods
    @IBAction func login(sender: UIButton) {
        self.view.endEditing(true)
        
        let story = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let leftSlideViewCtrl: UINavigationController = story.instantiateViewControllerWithIdentifier("settingNavCtrl") as! UINavigationController
        APPDELEGATE.mainViewNavCtrl = story.instantiateViewControllerWithIdentifier("tabBarCtrlNavCtrl") as? UINavigationController
        APPDELEGATE.rootViewCtrl = LeftSlideViewController(leftView: leftSlideViewCtrl, andMainView: APPDELEGATE.mainViewNavCtrl)
        APPDELEGATE.window?.rootViewController = APPDELEGATE.rootViewCtrl
        
        self.performSegueWithIdentifier("loginSuccess", sender: nil)
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
    //this action is supposed to hide keyboard.
    @IBAction func touchBkgView(sender: UIControl) {
        self.view.endEditing(true)
    }
    
    
    func keyboardWillHide(notif: NSNotification) {
        if IPHONE4S == false {
            return;
        }
        
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
    }
    
    func keyboardWillShow(notif: NSNotification) {
        if IPHONE4S == false {
            return;
        }
        
        self.view.frame = CGRectMake(0, -110, self.view.frame.size.width, self.view.frame.size.height)
    }
}

