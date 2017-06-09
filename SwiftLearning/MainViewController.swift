//
//  MainViewController.swift
//  SwiftLearning
//
//  Created by Al on 6/9/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let transistionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.toolbar.clipsToBounds = true
    }
    
    @IBAction func unwindToMainViewController (_ sender: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }

}
