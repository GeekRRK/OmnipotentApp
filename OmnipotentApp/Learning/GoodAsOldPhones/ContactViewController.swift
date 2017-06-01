//
//  ContactViewController.swift
//  OmnipotentApp
//
//  Created by Al on 5/7/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSize(width: 375, height: 800)
    }

}
