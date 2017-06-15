//
//  ViewController.swift
//  SwiftLearning
//
//  Created by Al on 6/15/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func datePickerDidSelectNewDate(_ sender: UIDatePicker) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.scheduleNotification(at: sender.date)
        }
    }

}
