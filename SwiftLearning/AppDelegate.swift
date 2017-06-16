//
//  AppDelegate.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/11/30.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit
import Contacts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CAAnimationDelegate {

    static var appDelegate: AppDelegate { return UIApplication.shared.delegate as! AppDelegate }
    
    var window: UIWindow?
    var contactStore = CNContactStore()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
    
    func requestForAccess(completionHandler: @escaping (_ accessGranted: Bool) -> Void) {
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        
        switch authorizationStatus {
        case .authorized:
            completionHandler(true)
        case .denied, .notDetermined:
            self.contactStore.requestAccess(for: .contacts, completionHandler: { (access, accessError) -> Void in
                if access {
                    completionHandler(access)
                } else {
                    if authorizationStatus == .denied {
                        DispatchQueue.main.async {
                            let message = "\(accessError!.localizedDescription)\n\nPlease allow the app to access your contacts through the Settings."
                            Helper.show(message: message)
                        }
                    }
                }
            })
        default:
            completionHandler(false)
        }
    }
    
}
