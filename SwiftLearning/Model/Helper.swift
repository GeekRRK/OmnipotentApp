//
//  Helper.swift
//  SwiftLearning
//
//  Created by Al on 6/16/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    static func show(message: String) {
        let alertController = UIAlertController(title: "Birthdays", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(dismissAction)
        
        let pushedViewController = (UIApplication.shared.keyWindow?.rootViewController as! UINavigationController).viewControllers
        let presentedViewController = pushedViewController.last
        
        presentedViewController?.present(alertController, animated: true, completion: nil)
    }
}

extension DateComponents {
    var asString: String? {
        if let date = Calendar.current.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = .current
            dateFormatter.dateStyle = .medium
            let dateString = dateFormatter.string(from: date)
            
            return dateString
        }
        
        return nil
    }
}
