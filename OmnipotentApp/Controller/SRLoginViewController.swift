//
//  ViewController.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/11/30.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

class SRLoginViewController: UIViewController, SRAnimatedImagesViewDelegate, UITextFieldDelegate {
    //MARK: - properties
    @IBOutlet weak var bkgView: SRAnimatedImagesView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userNameTextField: SRUnderlineTextField!
    @IBOutlet weak var passwordTextField: SRUnderlineTextField!
    
    //MARK: - system methods
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SRUtil.customizeNavBar(self.navigationController?.navigationBar)
        
        self.bkgView.isHidden = false
        bkgView.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SRUtil.deCustomizeNavBar(self.navigationController?.navigationBar)
        self.bkgView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loginBtn.setBackgroundImage(SRUtil.createImageWithColor(COLOR_LOGINBTN_NORMAL), for: UIControlState())
        self.loginBtn.setBackgroundImage(SRUtil.createImageWithColor(COLOR_LOGINBTN_HIGHTED), for: .highlighted)
        
        //Register notifications about keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(SRLoginViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(SRLoginViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        
        self.bkgView.delegate = self
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        (textField as! SRUnderlineTextField).highlited = true
        textField.setNeedsDisplay()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as! SRUnderlineTextField).highlited = false
        textField.setNeedsDisplay()
    }

    //MARK: - login related methods
    @IBAction func login(_ sender: UIButton) {
        self.view.endEditing(true)
        
        AlIndicator.sharedInstance.showIndicator({
                sleep(3)
            }, completion: {
                APPDELEGATE.enterApp()
        })
    }

    @IBAction func findPwd(_ sender: UIButton) {
    }
    
    @IBAction func newUser(_ sender: UIButton) {
    }
    
    //MARK: - SRAnimatedImagesViewDelegate
    func animatedImagesNumberOfImages(_ animatedImagesView: SRAnimatedImagesView) -> Int {
        return 2
    }
    
    func animatedImagesView(_ animatedImagesView: SRAnimatedImagesView, imageAtIndex: Int) -> UIImage {
        return UIImage(named: "login_background")!
    }
    
    //MARK: - response to notification about keyboard
    //this action is supposed to hide keyboard.
    @IBAction func touchBkgView(_ sender: UIControl) {
        self.view.endEditing(true)
    }
    
    func keyboardWillHide(_ notif: Notification) {
        if IPHONE4S == false {
            return;
        }
        
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
    
    func keyboardWillShow(_ notif: Notification) {
        if IPHONE4S == false {
            return;
        }
        
        self.view.frame = CGRect(x: 0, y: -110, width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
}

